param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$Analysis,[Parameter(Mandatory=$true)][string]$Output,[ValidateSet('v1','v2')][string]$Contract='v1')
$ErrorActionPreference='Stop'
$inv=[Globalization.CultureInfo]::InvariantCulture
function Hash-Text([string]$s) { $h=[Security.Cryptography.SHA256]::Create(); try { return ([BitConverter]::ToString($h.ComputeHash([Text.Encoding]::UTF8.GetBytes($s)))).Replace('-','').ToLowerInvariant() } finally {$h.Dispose()} }
function Canonical($v,[string]$type) {
  if($null -eq $v -or $v -is [DBNull]) {return 'N'}
  switch($type) {
    'Text' {return 'S'+[string]$v}
    'Memo' {return 'S'+[string]$v}
    'Boolean' {if([bool]$v){return 'B1'}else{return 'B0'}}
    'Integer' {return 'I'+([int16]$v).ToString($inv)}
    'Double' {$bytes=[BitConverter]::GetBytes([double]$v);if([BitConverter]::IsLittleEndian){[Array]::Reverse($bytes)};return 'D'+([BitConverter]::ToString($bytes)).Replace('-','').ToLowerInvariant()}
    'OLE' {$bytes=[byte[]]$v;$h=[Security.Cryptography.SHA256]::Create();try{return 'X'+$bytes.Length.ToString($inv)+':'+([BitConverter]::ToString($h.ComputeHash($bytes))).Replace('-','').ToLowerInvariant()}finally{$h.Dispose()}}
    'Long' {return 'I'+([int64]$v).ToString($inv)}
    'Money' {return 'M'+([decimal]$v).ToString('F4',$inv)}
    'DateTime' {return 'T'+([datetime]$v).ToString('yyyy-MM-ddTHH:mm:ss.ffffff',$inv)}
    default {throw ('Unsupported canonical type: '+$type)}
  }
}
function Q([string]$s){return '['+$s.Replace(']',']]')+']'}
$path=(Resolve-Path $Source).Path
$hash=(Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant()
$model=Get-Content $Analysis -Raw -Encoding UTF8|ConvertFrom-Json
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null
$reports=@();$attachments=@()
try {
  $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
  $db=$engine.OpenDatabase($path,$false,$true,$connect)
  $names=if($Contract -eq 'v2'){@($model.tables|Where-Object {-not $_.syntheticKind}|ForEach-Object {$_.name})}else{@('TbPessoa','CadResidencia','TbAtend')}
  foreach($name in $names) {
    $table=$model.tables|Where-Object name -eq $name
    $columns=@($table.columns|Where-Object {$Contract -eq 'v1' -or $_.typeName -ne 'ComplexType'})
    $pk=($table.indexes|Where-Object isPrimaryKey|Select-Object -First 1).columns[0].name
    $buffers=@{};$nulls=@{};$submicro=@{}
    foreach($col in $columns){$buffers[$col.name]=[Text.StringBuilder]::new();$nulls[$col.name]=0;$submicro[$col.name]=0}
    $rs=$db.OpenRecordset(('SELECT * FROM '+(Q $name)+' ORDER BY '+(Q $pk)),4)
    $fields=@{};foreach($col in $columns){$fields[$col.name]=$rs.Fields.Item($col.name)}
    $pkField=$rs.Fields.Item($pk)
    $count=0;$keys=[Collections.Generic.HashSet[string]]::new()
    try {
      while(-not $rs.EOF){
        $key=Canonical $pkField.Value 'Long'
        if(-not $keys.Add($key)){throw 'Duplicate primary key in DAO source'}
        foreach($col in $columns){
          $value=$fields[$col.name].Value
          if($null -eq $value -or $value -is [DBNull]){$nulls[$col.name]++}
          if($col.typeName -eq 'DateTime' -and $value -is [datetime] -and ($value.Ticks % 10) -ne 0){$submicro[$col.name]++}
          $canonical=Canonical $value $col.typeName
          [void]$buffers[$col.name].Append($key.Length.ToString($inv)+':'+$key+$canonical.Length.ToString($inv)+':'+$canonical)
        }
        $count++;$rs.MoveNext()
      }
    }finally{$rs.Close()}
    $cols=@();foreach($col in $columns){$cols += [pscustomobject]@{name=$col.name;type=$col.typeName;sha256=(Hash-Text $buffers[$col.name].ToString());nullCount=$nulls[$col.name];submicrosecondCount=$submicro[$col.name]}}
    $reports += [pscustomobject]@{table=$name;primaryKey=$pk;rows=$count;columns=$cols}
    Write-Output ('HASHED_TABLE='+$name+' ROWS='+$count)
  }
  foreach($table in $model.tables|Where-Object {$Contract -eq 'v1' -and $_.syntheticKind -eq 'attachment'}){
    $parentSchema=$model.tables|Where-Object name -eq $table.attachmentParentTable
    $pk=($parentSchema.indexes|Where-Object isPrimaryKey|Select-Object -First 1).columns[0].name
    $rs=$db.OpenRecordset(('SELECT * FROM '+(Q $table.attachmentParentTable)+' ORDER BY '+(Q $pk)),4)
    try{
      while(-not $rs.EOF){
        $keyHash=Hash-Text (Canonical $rs.Fields.Item($pk).Value 'Long')
        $children=$rs.Fields.Item($table.attachmentParentColumn).Value;$ordinal=0
        try{
          while(-not $children.EOF){
            $temp=Join-Path $env:TEMP ([guid]::NewGuid().ToString('N')+'.bin')
            try{
              $children.Fields.Item('FileData').SaveToFile($temp)
              $attachments += [pscustomobject]@{table=$table.name;parentKeyHash=$keyHash;ordinal=$ordinal;length=(Get-Item $temp).Length;sha256=(Get-FileHash $temp -Algorithm SHA256).Hash.ToLowerInvariant()}
            }finally{if(Test-Path $temp){Remove-Item $temp}}
            $ordinal++;$children.MoveNext()
          }
        }finally{$children.Close()}
        $rs.MoveNext()
      }
    }finally{$rs.Close()}
  }
}finally{if($db){$db.Close()};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)}
if((Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash){throw 'Source changed during audit'}
$result=[pscustomobject]@{sourceSha256=$hash;contract=('typed-column-pk-'+$Contract);scope=$(if($Contract -eq 'v2'){'all-physical-scalar-columns; excludes ComplexType and nested payloads'}else{'three-table-scalars-and-attachments'});rules='UTF16 length framing; UTF8 SHA256; strings exact; null N != empty S; v2 Double IEEE754 big-endian hex; Integer Int16; OLE Xlength:SHA256 raw bytes; currency fixed4; dates civil components microseconds, no timezone conversion; submicrosecond counts explicit';tables=$reports;attachments=$attachments}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,($result|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
Write-Output ('HASHED_ATTACHMENTS='+$attachments.Count)
