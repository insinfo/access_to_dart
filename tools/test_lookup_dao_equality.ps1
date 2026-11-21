# Synthetic oracle; never opens an existing Access database.
$ErrorActionPreference = 'Stop'
$path = Join-Path $env:TEMP ('codex_lookup_equality_' + [guid]::NewGuid().ToString('N') + '.accdb')
$engine = New-Object -ComObject DAO.DBEngine.120
$db = $null
$rs = $null
try {
  $db = $engine.CreateDatabase($path, ';LANGID=0x0409;CP=1252;COUNTRY=0;', 128)
  $db.Execute('CREATE TABLE Samples (ID INTEGER, Label TEXT(100))')
  $db.Execute("INSERT INTO Samples VALUES (1, 'Pessoa de Referencia')")
  $db.Execute("INSERT INTO Samples VALUES (2, 'pessoa de referencia')")
  $accented = 'Pessoa de Refer' + [char]0x00ea + 'ncia'
  $db.Execute("INSERT INTO Samples VALUES (3, '$accented')")
  $db.Execute('INSERT INTO Samples (ID) VALUES (4)')
  $rs = $db.OpenRecordset("SELECT ID FROM Samples WHERE Label='Pessoa de Referencia' ORDER BY ID", 4)
  $ids = @()
  while (-not $rs.EOF) {
    $ids += $rs.Fields.Item(0).Value
    $rs.MoveNext()
  }
  if (($ids -join ',') -ne '1,2') { throw 'Unexpected Access equality semantics' }
  Write-Output 'DAO_LOOKUP_EQUALITY_OK: ids=1,2; accented and NULL excluded'
} finally {
  if ($rs) { $rs.Close() }
  if ($db) { $db.Close() }
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($engine)
  if (Test-Path $path) { Remove-Item $path }
  Write-Output ('TEMP_REMOVED=' + (-not (Test-Path $path)))
}
