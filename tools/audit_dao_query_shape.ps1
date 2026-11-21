param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$Analysis,[Parameter(Mandatory=$true)][string]$QueryName,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
$path=(Resolve-Path $Source).Path
$hash=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
$model=Get-Content -LiteralPath $Analysis -Raw -Encoding UTF8|ConvertFrom-Json
$matches=@($model.queries|Where-Object name -eq $QueryName)
if($matches.Count -ne 1){throw 'Expected one named query'}
$sql=$matches[0].sqlText
if($sql -notmatch '^\s*SELECT\b'){throw 'This probe accepts SELECT only'}
$sha=[Security.Cryptography.SHA256]::Create()
try{$sqlHash=([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($sql)))).Replace('-','').ToLowerInvariant()}finally{$sha.Dispose()}
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null;$query=$null;$rs=$null
try {
 $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
 $db=$engine.OpenDatabase($path,$false,$true,$connect)
 $query=$db.CreateQueryDef('',$sql)
 $parameters=@()
 foreach($parameter in $query.Parameters){
  $parameters += [pscustomobject]@{name=$parameter.Name;daoType=$parameter.Type}
  $parameter.Value=0
 }
 $rs=$query.OpenRecordset(4)
 $columns=@();$ordinal=0
 foreach($field in $rs.Fields){
  $columns += [pscustomobject]@{ordinal=$ordinal;name=$field.Name;daoType=$field.Type}
  $ordinal++
 }
 $result=[pscustomobject]@{sourceSha256=$hash;queryName=$QueryName;sqlSha256=$sqlHash;readOnly=$true;parameters=$parameters;columns=$columns;scope='query shape only; zero-valued parameters are not a result-parity test'}
}finally{
 if($rs){$rs.Close()};if($query){$query.Close()};if($db){$db.Close()}
 [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)
}
if((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash){throw 'Source changed during shape audit'}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,($result|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
Write-Output ('QUERY_COLUMNS='+$columns.Count+' PARAMETERS='+$parameters.Count+' SOURCE_UNCHANGED=True')
