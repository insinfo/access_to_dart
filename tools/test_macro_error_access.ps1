# Controlled macro oracle: only a new temporary database and synthetic rows.
# SetTempVar instruments the conditional MsgBox branch without a native modal dialog.
# It is not a visual/accessibility test of the original MsgBox window.
$ErrorActionPreference = 'Stop'
$dir = Join-Path $env:TEMP ('codex_macro_error_' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory $dir | Out-Null
$path = Join-Path $dir 'oracle.accdb'
$app=$null; $db=$null; $form=$null
try {
  $app=New-Object -ComObject Access.Application
  $app.NewCurrentDatabase($path)
  $db=$app.CurrentDb()
  $db.Execute('CREATE TABLE NavSamples (ID INTEGER CONSTRAINT NavPK PRIMARY KEY)')
  $db.Execute('INSERT INTO NavSamples VALUES (10)')
  $db.Execute('INSERT INTO NavSamples VALUES (20)')
  $form=$app.CreateForm(); $name=$form.Name
  $form.RecordSource='SELECT ID FROM NavSamples ORDER BY ID'
  $app.DoCmd.Close(2,$name,1)
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form);$form=$null
  $macro=@'
Version =196611
ColumnsShown =10
Begin
    Action ="OnError"
    Argument ="0"
End
Begin
    Action ="GoToRecord"
    Argument ="-1"
    Argument =""
    Argument ="0"
End
Begin
    Condition ="[MacroError]<>0"
    Action ="SetTempVar"
    Argument ="ObservedError"
    Argument ="=[MacroError].[Number]"
End
'@
  $macroPath=Join-Path $dir 'probe.txt'
  [IO.File]::WriteAllText($macroPath,$macro,[Text.Encoding]::Unicode)
  $app.LoadFromText(4,'ErrorProbe',$macroPath)
  $app.DoCmd.OpenForm($name,0)
  $form=$app.Forms.Item($name)
  $results=@()
  foreach($start in @(2,3,2,3)) {
    $app.TempVars.RemoveAll()
    $app.DoCmd.GoToRecord(2,$name,$start)
    $app.DoCmd.RunMacro('ErrorProbe')
    $number=0
    try{$number=[int]$app.TempVars.Item('ObservedError').Value}catch{}
    if($start -eq 2 -and $number -ne 2105){throw "Expected boundary MacroError2105, got $number"}
    if($start -eq 3 -and $number -ne 0){throw 'MacroError leaked into successful execution'}
    $results+=@{start=$start;macro_error=$number;id=$form.Recordset.Fields.Item('ID').Value}
  }
  $results|ConvertTo-Json
} finally {
  if($form){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form);$form=$null}
  if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null}
  if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app);$app=$null}
  [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
  for($attempt=0;$attempt -lt 20 -and (Test-Path $dir);$attempt++){
    try{Remove-Item -Recurse $dir}catch{Start-Sleep -Milliseconds 250}
  }
  if(Test-Path $dir){throw "Temporary oracle directory remains locked: $dir"}
  Write-Output 'TEMP_REMOVED=True'
}
