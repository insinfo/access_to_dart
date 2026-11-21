param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$Analysis,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
function Hash-Text([string]$text) { $sha=[Security.Cryptography.SHA256]::Create();try{return ([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($text)))).Replace('-','').ToLowerInvariant()}finally{$sha.Dispose()} }
function Q([string]$s) { return '['+$s.Replace(']',']]')+']' }
$path=(Resolve-Path $Source).Path
$hash=(Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant()
$model=Get-Content $Analysis -Raw -Encoding UTF8|ConvertFrom-Json
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null;$results=@()
try {
 $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
 $db=$engine.OpenDatabase($path,$false,$true,$connect)
 foreach($table in $model.tables) {
  if($table.syntheticKind){continue}
  foreach($column in $table.columns|Where-Object typeName -eq 'ComplexType') {
   $pkColumns=($table.indexes|Where-Object isPrimaryKey|Select-Object -First 1).columns
   if($pkColumns.Count -ne 1){throw 'Complex audit requires a single source primary key'}
   $pk=$pkColumns[0].name
   $rs=$db.OpenRecordset(('SELECT '+(Q $pk)+', '+(Q $column.name)+' FROM '+(Q $table.name)),4)
   $valueRecords=[Collections.Generic.List[string]]::new()
   $parents=0;$nonempty=0;$total=0;$schema=@();$nullValues=0
   try {
    while(-not $rs.EOF) {
     $children=$rs.Fields.Item($column.name).Value;$n=0
     try {
      if($schema.Count -eq 0){foreach($field in $children.Fields){$schema += [pscustomobject]@{name=$field.Name;daoType=$field.Type}}}
      while(-not $children.EOF){
       if($schema.Count -eq 1 -and $schema[0].name -eq 'Value' -and $schema[0].daoType -eq 10){
        $key='I'+([int64]$rs.Fields.Item($pk).Value).ToString([Globalization.CultureInfo]::InvariantCulture)
        $value=$children.Fields.Item('Value').Value
        $canonical=if($null -eq $value -or $value -is [DBNull]){'N'}else{'S'+[string]$value}
        $valueRecords.Add($key.Length.ToString()+':'+$key+$canonical.Length.ToString()+':'+$canonical)
       }
       foreach($field in $children.Fields){if($null -eq $field.Value -or $field.Value -is [DBNull]){$nullValues++}}
       $n++;$children.MoveNext()
      }
     }finally{$children.Close()}
     if($n -gt 0){$nonempty++};$parents++;$total+=$n;$rs.MoveNext()
    }
   }finally{$rs.Close()}
   $valueHash=$null
   if($schema.Count -eq 1 -and $schema[0].name -eq 'Value' -and $schema[0].daoType -eq 10){
    $valueRecords.Sort([StringComparer]::Ordinal)
    $valueHash=Hash-Text ([string]::Join('', $valueRecords))
   }
   $results += [pscustomobject]@{table=$table.name;column=$column.name;parentRows=$parents;parentsWithChildren=$nonempty;childRows=$total;nullFieldValues=$nullValues;childSchema=$schema;primaryKey=$pk;valueSha256=$valueHash;valueContract='sorted-parent-pk-text-v1'}
   Write-Output ('COUNTED_COMPLEX='+$table.name+'.'+$column.name+' CHILD_ROWS='+$total)
  }
 }
}finally{if($db){$db.Close()};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)}
if((Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash){throw 'Source changed during complex audit'}
$result=[pscustomobject]@{sourceSha256=$hash;readOnly=$true;hashUnchangedAfterAudit=$true;scope='DAO complex counts, schema and exact text multiset hashes; no row values';columns=$results}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,($result|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
