param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$Analysis,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
function GetTextDigest([string]$s){$h=[Security.Cryptography.SHA256]::Create();try{return ([BitConverter]::ToString($h.ComputeHash([Text.Encoding]::UTF8.GetBytes($s)))).Replace('-','').ToLowerInvariant()}finally{$h.Dispose()}}
function B([string]$s){return [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($s))}
function Q([string]$s){return '['+$s.Replace(']',']]')+']'}
function Canonical($value,[int]$type){
 if($null -eq $value -or $value -is [DBNull]){return 'N'}
 switch($type){
  4 {return 'I'+([int]$value).ToString([Globalization.CultureInfo]::InvariantCulture)}
  8 {return 'T'+([datetime]$value).ToString('yyyy-MM-ddTHH:mm:ss.ffffff',[Globalization.CultureInfo]::InvariantCulture)}
  10 {return 'S'+[string]$value}
  12 {return 'S'+[string]$value}
  default {throw 'Unsupported attachment metadata/parent type'}
 }
}
$path=(Resolve-Path $Source).Path
$before=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
$model=Get-Content -LiteralPath $Analysis -Raw -Encoding UTF8|ConvertFrom-Json
$metadata=@('FileName','FileType','FileTimeStamp','FileFlags','FileURL')
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null;$collections=@();$total=0
$work=Join-Path ([IO.Path]::GetTempPath()) ('attachment_metadata_'+[Guid]::NewGuid().ToString())
[IO.Directory]::CreateDirectory($work)|Out-Null
try {
 $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
 $db=$engine.OpenDatabase($path,$false,$true,$connect)
 foreach($child in $model.tables|Where-Object syntheticKind -eq 'attachment') {
  $parent=@($model.tables|Where-Object name -eq $child.attachmentParentTable)
  if($parent.Count -ne 1){throw 'Expected one attachment parent'}
  $pks=@(($parent[0].indexes|Where-Object isPrimaryKey).columns)
  if($pks.Count -ne 1){throw 'Metadata audit requires a single physical parent primary key'}
  $pk=$pks[0].name;$column=$child.attachmentParentColumn
  $rs=$db.OpenRecordset(('SELECT '+(Q $pk)+', '+(Q $column)+' FROM '+(Q $parent[0].name)),4)
  $records=@();$schema=@();$parentType=$null;$parents=0
  try {
   $parentType=$rs.Fields.Item($pk).Type
   if($parentType -ne 4){throw 'Expected supported DAO Long parent key'}
   while(-not $rs.EOF){
    $parentHash=GetTextDigest (Canonical $rs.Fields.Item($pk).Value $parentType)
    $association=GetTextDigest ((B $parent[0].name)+"`n"+(B $column)+"`n"+$parentHash)
    $children=$rs.Fields.Item($column).Value
    try {
     if($schema.Count -eq 0){foreach($field in $children.Fields){$schema += [pscustomobject]@{name=$field.Name;daoType=$field.Type}}}
     foreach($name in $metadata){if(@($schema|Where-Object name -eq $name).Count -ne 1){throw 'Expected DAO-visible metadata field absent'}}
     while(-not $children.EOF){
      $cells=@();$cellHashes=@()
      foreach($name in $metadata){
       $field=$children.Fields.Item($name);$canonical=Canonical $field.Value $field.Type;$digest=GetTextDigest $canonical
       $cells += [pscustomobject]@{name=$name;daoType=$field.Type;isNull=($canonical -eq 'N');valueSha256=$digest}
       $cellHashes += $digest
      }
      $file=Join-Path $work ([Guid]::NewGuid().ToString()+'.bin')
      $children.Fields.Item('FileData').SaveToFile($file)
      $payload=(Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
      $length=(Get-Item -LiteralPath $file).Length;Remove-Item -LiteralPath $file
      $records += [pscustomobject]@{associationSha256=$association;parentKeySha256=$parentHash;payloadSha256=$payload;payloadLength=$length;metadata=$cells;recordSha256=(GetTextDigest ($association+"`n"+$payload+"`n"+($cellHashes -join "`n")))}
      $total++;$children.MoveNext()
     }
    }finally{$children.Close()}
    $parents++;$rs.MoveNext()
   }
  }finally{$rs.Close()}
  $collections += [pscustomobject]@{table=$parent[0].name;column=$column;primaryKey=$pk;parentDaoType=$parentType;parentRows=$parents;childSchema=$schema;records=$records}
 }
}finally{
 if($db){$db.Close()};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)
 Remove-Item -LiteralPath $work -Recurse -Force
}
if((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $before){throw 'Source changed during DAO audit'}
$result=[pscustomobject]@{contract='attachment-metadata-parent-v1';sourceSha256=$before;readOnly=$true;sourceUnchanged=$true;timestampCanonical='civil microseconds; no timezone conversion';hiddenChildIdsUsed=$false;collections=$collections}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,($result|ConvertTo-Json -Depth 12),[Text.UTF8Encoding]::new($false))
Write-Output ('ATTACHMENT_COLLECTIONS='+$collections.Count+' ATTACHMENT_RECORDS='+$total+' SOURCE_UNCHANGED=True')
