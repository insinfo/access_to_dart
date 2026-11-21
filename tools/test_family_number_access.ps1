# Source-expression oracle, not a claim that COM assignments trigger BeforeInsert.
# Only a new temporary database is created; no SIGAsul file is opened.
$ErrorActionPreference='Stop'
$path=Join-Path $env:TEMP ('codex_family_number_'+[guid]::NewGuid().ToString('N')+'.accdb')
$app=$null;$db=$null
try {
  $app=New-Object -ComObject Access.Application
  $app.NewCurrentDatabase($path)
  $db=$app.CurrentDb()
  $db.Execute('CREATE TABLE CadResidencia (CodFam LONG CONSTRAINT FamilyPK PRIMARY KEY)')
  $form=$app.CreateForm(); $formName=$form.Name
  $form.RecordSource='CadResidencia'
  $control=$app.CreateControl($formName,109,0,'','CodFam',100,100,1000,300)
  $control.Name='CodResid'; $control.Enabled=$false
  $enabled=[bool]$control.Enabled; $locked=[bool]$control.Locked
  $export=$path+'.form.txt'
  $app.DoCmd.Close(2,$formName,1)
  $app.SaveAsText(2,$formName,$export)
  $text=[IO.File]::ReadAllText($export,[Text.Encoding]::Unicode)
  if($text -notmatch 'Enabled = NotDefault'){throw 'Unexpected serialization of disabled control'}
  if($enabled -or $locked){throw 'Unexpected Enabled/Locked defaults'}
  Write-Output ('CONTROL_ENABLED='+$enabled+';LOCKED='+$locked+';EXPORT_ENABLED_NOTDEFAULT=True')
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($control);$control=$null
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form);$form=$null
  Remove-Item -LiteralPath $export
  $results=@()
  foreach($scenario in @('empty','one','gap','delete_max')) {
    if($scenario -eq 'one'){$db.Execute('INSERT INTO CadResidencia VALUES (1)')}
    if($scenario -eq 'gap'){$db.Execute('INSERT INTO CadResidencia VALUES (10)')}
    if($scenario -eq 'delete_max'){$db.Execute('DELETE FROM CadResidencia WHERE CodFam=10')}
    $count=[int]$app.DCount('*','CadResidencia')
    if($count -lt 1){$next=1}else{$next=([int]$app.DMax('CodFam','CadResidencia'))+1}
    $expected=@{empty=1;one=2;gap=11;delete_max=2}[$scenario]
    if($next -ne $expected){throw "Unexpected generated number in scenario $scenario"}
    $results+=@{scenario=$scenario;count=$count;next=$next}
  }
  $results|ConvertTo-Json
} finally {
  if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null}
  if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app);$app=$null}
  [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
  for($attempt=0;$attempt -lt 20 -and (Test-Path $path);$attempt++){
    try{Remove-Item -LiteralPath $path}catch{Start-Sleep -Milliseconds 250}
  }
  if(Test-Path $path){throw "Oracle file remains locked: $path"}
  Write-Output 'TEMP_REMOVED=True'
}
