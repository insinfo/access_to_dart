param(
  [Parameter(Mandatory=$true)][string]$Source,
  [Parameter(Mandatory=$true)][string]$Analysis,
  [Parameter(Mandatory=$true)][string]$Output
)
# Independent read-only DAO oracle. No row values or attachment payloads exported.
# Set ACCESS_DAO_PASSWORD in this process environment if the source is encrypted.
$ErrorActionPreference = 'Stop'
$sourcePath = (Resolve-Path $Source).Path
$analysisPath = (Resolve-Path $Analysis).Path
$sourceHash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
$analysisHash = (Get-FileHash -LiteralPath $analysisPath -Algorithm SHA256).Hash.ToLowerInvariant()
$model = Get-Content -LiteralPath $analysisPath -Raw -Encoding UTF8 | ConvertFrom-Json
$engine = New-Object -ComObject DAO.DBEngine.120
$db = $null
$results = @()
function Quote-Identifier([string]$name) { return '[' + $name.Replace(']', ']]') + ']' }
try {
  $connect = if ($env:ACCESS_DAO_PASSWORD) { ';PWD=' + $env:ACCESS_DAO_PASSWORD } else { '' }
  $db = $engine.OpenDatabase($sourcePath, $false, $true, $connect)
  foreach ($table in $model.tables) {
    $count = 0
    $recordCount = $null
    $snapshotCount = $null
    $parentTable = $table.complexParentTable
    $parentColumn = $table.complexParentColumn
    if (-not $parentTable) { $parentTable = $table.attachmentParentTable }
    if (-not $parentColumn) { $parentColumn = $table.attachmentParentColumn }
    if ($table.syntheticKind -in @('attachment', 'multivalue')) {
      if (-not $parentTable -or -not $parentColumn) {
        throw 'Complex collection mapping is incomplete'
      }
      $parent = $db.OpenRecordset(('SELECT ' + (Quote-Identifier $parentColumn) + ' FROM ' + (Quote-Identifier $parentTable)), 4)
      try {
        while (-not $parent.EOF) {
          $children = $parent.Fields.Item(0).Value
          try {
            while (-not $children.EOF) { $count++; $children.MoveNext() }
          } finally { $children.Close() }
          $parent.MoveNext()
        }
      } finally { $parent.Close() }
      $method = 'DAO.Field.Value.Recordset2 iteration'
    } else {
      $quoted = Quote-Identifier $table.name
      $rs = $db.OpenRecordset(('SELECT COUNT(*) FROM ' + $quoted), 4)
      try { $count = $rs.Fields.Item(0).Value } finally { $rs.Close() }
      $recordCount = $db.TableDefs.Item($table.name).RecordCount
      if ($count -ne $table.rowCount) {
        $rs = $db.OpenRecordset(('SELECT * FROM ' + $quoted), 4)
        try {
          if (-not $rs.EOF) { $rs.MoveLast() }
          $snapshotCount = $rs.RecordCount
        } finally { $rs.Close() }
      }
      $method = 'DAO SELECT COUNT(*) snapshot read-only'
    }
    $results += [pscustomobject]@{
      table = $table.name
      catalogRows = $table.rowCount
      daoCount = $count
      daoTableDefRecordCount = $recordCount
      daoSnapshotMoveLastCount = $snapshotCount
      method = $method
      parentTable = $parentTable
      parentColumn = $parentColumn
    }
  }
} finally {
  if ($db) { $db.Close() }
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)
}
$afterHash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($afterHash -ne $sourceHash) { throw 'Source hash changed during read-only audit; oracle rejected' }
$oracle = [pscustomobject]@{
  scope = 'dao_count_star_and_complex_recordsets'
  source = [pscustomobject]@{
    path = $sourcePath
    sha256 = $sourceHash
    sizeBytes = (Get-Item -LiteralPath $sourcePath).Length
    readOnly = $true
    hashUnchangedAfterAudit = $true
  }
  analysis = [pscustomobject]@{ path = $analysisPath; sha256 = $analysisHash }
  tables = $results
}
$outputPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
[IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($outputPath)) | Out-Null
[IO.File]::WriteAllText($outputPath, ($oracle | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
Write-Output ('DAO_ORACLE_TABLES=' + $results.Count)
Write-Output ('DAO_ORACLE_ROWS=' + ($results | Measure-Object -Property daoCount -Sum).Sum)
Write-Output ('SOURCE_HASH_UNCHANGED=' + ($sourceHash -eq $afterHash))
