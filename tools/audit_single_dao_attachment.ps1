param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$Table,[Parameter(Mandatory=$true)][string]$Column,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
function Q([string]$s){return '['+$s.Replace(']',']]')+']'}
$path=(Resolve-Path $Source).Path
$hash=(Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant()
$work=Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid().ToString())
[IO.Directory]::CreateDirectory($work)|Out-Null
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null;$rs=$null;$result=@()
try {
 $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
 $db=$engine.OpenDatabase($path,$false,$true,$connect)
 $rs=$db.OpenRecordset(('SELECT '+(Q $Column)+' FROM '+(Q $Table)),4)
 while(-not $rs.EOF){
  $children=$rs.Fields.Item($Column).Value
  try {
   while(-not $children.EOF){
    $file=Join-Path $work ([Guid]::NewGuid().ToString()+'.bin')
    $children.Fields.Item('FileData').SaveToFile($file)
    $result += [pscustomobject]@{payloadLength=(Get-Item $file).Length;payloadSha256=(Get-FileHash $file -Algorithm SHA256).Hash.ToLowerInvariant()}
    Remove-Item $file
    $children.MoveNext()
   }
  }finally{$children.Close()}
  $rs.MoveNext()
 }
}finally{if($rs){$rs.Close()};if($db){$db.Close()};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine);Remove-Item $work -Recurse -Force}
if((Get-FileHash $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash){throw 'Source changed during read-only audit'}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,([pscustomobject]@{sourceSha256=$hash;table=$Table;column=$Column;readOnly=$true;attachments=$result}|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
Write-Output ('HASHED_ATTACHMENTS='+$result.Count)
