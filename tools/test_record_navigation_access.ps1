# Controlled Access UI oracle. Creates only an isolated temporary database.
$ErrorActionPreference = 'Stop'
$path = Join-Path $env:TEMP ('codex_record_navigation_' + [guid]::NewGuid().ToString('N') + '.accdb')
$app = $null
$db = $null
$form = $null
$result = @()
try {
  $app = New-Object -ComObject Access.Application
  $app.NewCurrentDatabase($path)
  $db = $app.CurrentDb()
  $db.Execute('CREATE TABLE NavSamples (ID INTEGER CONSTRAINT NavSamplesPK PRIMARY KEY, Caption TEXT(20))')
  foreach ($id in @(10,20,30)) { $db.Execute("INSERT INTO NavSamples VALUES ($id, 'Synthetic')") }
  $form = $app.CreateForm()
  $name = $form.Name
  $form.RecordSource = 'SELECT ID, Caption FROM NavSamples ORDER BY ID'
  $app.DoCmd.Close(2, $name, 1)
  $form = $null
  $app.DoCmd.OpenForm($name, 0)
  $form = $app.Forms.Item($name)
  foreach ($case in @(@{Token=2;Expected=10},@{Token=1;Expected=20},@{Token=3;Expected=30},@{Token=0;Expected=20})) {
    $app.DoCmd.GoToRecord(2, $name, $case.Token)
    $actual = $form.Recordset.Fields.Item('ID').Value
    if ($actual -ne $case.Expected) { throw "Unexpected navigation result for token $($case.Token)" }
    $result += @{token=$case.Token; id=$actual; current_record=$form.CurrentRecord}
  }
  $app.DoCmd.GoToRecord(2, $name, 3)
  $app.DoCmd.GoToRecord(2, $name, 1)
  if (-not $form.NewRecord) { throw 'Next after last did not enter new record' }
  $result += @{next_after_last_new_record=[bool]$form.NewRecord; current_record=$form.CurrentRecord}
  $app.DoCmd.GoToRecord(2, $name, 0)
  if ($form.Recordset.Fields.Item('ID').Value -ne 30) { throw 'Previous from new did not return to last' }
  $result += @{previous_from_new_id=$form.Recordset.Fields.Item('ID').Value}
  $app.DoCmd.GoToRecord(2, $name, 5)
  if (-not $form.NewRecord) { throw 'New record not active' }
  if ($form.Dirty) { throw 'Navigation unexpectedly dirtied form' }
  $count = $db.OpenRecordset('SELECT Count(*) AS N FROM NavSamples')
  try { if ($count.Fields.Item(0).Value -ne 3) { throw 'Navigation wrote a row' } } finally { $count.Close() }
  $result += @{token=5; new_record=$true; dirty=$false; stored_rows=3}
  $app.DoCmd.GoToRecord(2, $name, 2)
  $boundaryError = $false
  try { $app.DoCmd.GoToRecord(2, $name, 0) } catch { $boundaryError = $true }
  if (-not $boundaryError) { throw 'Expected boundary error before first record' }
  $result += @{previous_before_first_rejected=$true; id=$form.Recordset.Fields.Item('ID').Value}
  $result | ConvertTo-Json -Depth 6
} finally {
  if ($form) { [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form); $form = $null }
  if ($count) { [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($count); $count = $null }
  if ($db) { $db.Close(); [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db); $db = $null }
  if ($app) {
    try { $app.CloseCurrentDatabase() } catch {}
    try { $app.Quit(2) } catch {}
    [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app)
  }
  $app = $null
  [GC]::Collect(); [GC]::WaitForPendingFinalizers(); [GC]::Collect()
  for ($attempt = 0; $attempt -lt 20 -and (Test-Path $path); $attempt++) {
    try { Remove-Item $path } catch { Start-Sleep -Milliseconds 250 }
  }
  if (Test-Path $path) { throw "Temporary oracle database remains locked: $path" }
  Write-Output ('TEMP_REMOVED=' + (-not (Test-Path $path)))
}
