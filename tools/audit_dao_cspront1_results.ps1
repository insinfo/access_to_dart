param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$SqlFile,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
$path=(Resolve-Path $Source).Path
$hash=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
$sql=Get-Content -LiteralPath $SqlFile -Raw -Encoding UTF8
# This developer oracle runs only the checked-in, read-only CSPRONT1 fixture.
$expected=(Resolve-Path 'fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql').Path
if((Resolve-Path $SqlFile).Path -ne $expected){throw 'Only the CSPRONT1 fixture is accepted'}
$invariant=[Globalization.CultureInfo]::InvariantCulture
$engine=New-Object -ComObject DAO.DBEngine.120
$db=$null;$q=$null;$rs=$null;$keys=$null
try {
 $connect=if($env:ACCESS_DAO_PASSWORD){';PWD='+$env:ACCESS_DAO_PASSWORD}else{''}
 $db=$engine.OpenDatabase($path,$false,$true,$connect)
 $q=$db.CreateQueryDef('',$sql)
 if($q.Parameters.Count -ne 1 -or $q.Parameters[0].Type -ne 10){throw 'Unexpected parameter contract'}
 $candidates=[Collections.Generic.List[string]]::new();$candidates.Add('0');$candidates.Add('-1')
 $keys=$db.OpenRecordset('SELECT TOP 100 CodFam FROM CadResidencia WHERE DataDesligResid Is Null ORDER BY CodFam',4)
 while(-not $keys.EOF){$candidates.Add([string]$keys.Fields[0].Value);$keys.MoveNext()};$keys.Close();$keys=$null
 $cases=@();$positive=0
 foreach($key in $candidates){
  $q.Parameters[0].Value=$key
  $rs=$q.OpenRecordset(4);$hashes=@()
  while(-not $rs.EOF){
   $cells=@()
   foreach($field in $rs.Fields){
    $value=$field.Value
    if($null -eq $value -or $value -is [DBNull]){$cells+='N';continue}
    switch($field.Type){
     1 {$text=if([bool]$value){'true'}else{'false'}}
     4 {$text=([int]$value).ToString($invariant)}
     5 {$text=([decimal]$value).ToString('F4',$invariant)}
     8 {$text=([datetime]$value).ToString('yyyy-MM-ddTHH:mm:ss.fff',$invariant)}
     10 {$text=[string]$value}
     default {throw 'Unsupported result type'}
    }
    $cells+='V'+[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($text))
   }
   $sha=[Security.Cryptography.SHA256]::Create()
   try {$hashes+=([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes(($cells -join '|'))))).Replace('-','').ToLowerInvariant()} finally{$sha.Dispose()}
   $rs.MoveNext()
  }
  $rs.Close();$rs=$null
  $cases += [pscustomobject]@{parameter=$key;rowHashes=@($hashes|Sort-Object)}
  if($hashes.Count -gt 0){$positive++}
  if($positive -ge 5){break}
 }
 if($positive -lt 5){throw 'Insufficient nonempty parity cases'}
 $sha=[Security.Cryptography.SHA256]::Create()
 try{$sqlHash=([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($sql)))).Replace('-','').ToLowerInvariant()}finally{$sha.Dispose()}
 $result=[pscustomobject]@{sourceSha256=$hash;sqlSha256=$sqlHash;readOnly=$true;columnCount=134;cases=$cases}
}finally{
 if($rs){$rs.Close()};if($keys){$keys.Close()};if($q){$q.Close()};if($db){$db.Close()}
 [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)
}
if((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash){throw 'Source changed during oracle'}
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($out))|Out-Null
[IO.File]::WriteAllText($out,($result|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
Write-Output ('PARITY_CASES='+$cases.Count+' NONEMPTY='+$positive+' SOURCE_UNCHANGED=True')
