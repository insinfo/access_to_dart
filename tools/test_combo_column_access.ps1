# Synthetic controls only; does not open or change SIGAsul.
$ErrorActionPreference='Stop'
$path=Join-Path $env:TEMP ('codex_combo_column_'+[guid]::NewGuid().ToString('N')+'.accdb')
$app=$null;$db=$null;$form=$null;$combo=$null
try {
 $app=New-Object -ComObject Access.Application
 $app.NewCurrentDatabase($path)
 $db=$app.CurrentDb()
 $db.Execute('CREATE TABLE Employees (Id LONG, FullName TEXT(50), RoleName TEXT(50))')
 $db.Execute("INSERT INTO Employees VALUES (7,'Synthetic name','Synthetic role')")
 $form=$app.CreateForm();$name=$form.Name
 $combo=$app.CreateControl($name,111,0,'','',100,100,1500,300)
 $combo.Name='EmployeeCombo';$combo.RowSourceType='Table/Query'
 $combo.RowSource='SELECT Id, FullName, RoleName FROM Employees ORDER BY Id'
 $combo.BoundColumn=1;$combo.ColumnCount=2
 $app.DoCmd.Close(2,$name,1)
 [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($combo);$combo=$null
 [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form);$form=$null
 $app.DoCmd.OpenForm($name,0)
 $form=$app.Forms.Item($name);$combo=$form.Controls.Item('EmployeeCombo')
 $results=@()
 foreach($count in @(2,3)) {
  $combo.ColumnCount=$count;$combo.Requery();$combo.Value=7
  foreach($index in @(0,1,2,3)) {
   try {
    $value=$app.Eval(('Forms![{0}]![EmployeeCombo].Column({1})' -f $name,$index))
    $isNull=($null -eq $value -or $value -is [DBNull])
    $results+=@{columnCount=$count;actualColumnCount=[int]$combo.ColumnCount;column=$index;isNull=$isNull;value=if($isNull){$null}else{$value};error=$null}
   } catch { $results+=@{columnCount=$count;column=$index;error=$_.Exception.Message} }
  }
 }
 foreach($result in $results){
  if($result.error){throw $result.error}
  if($result.actualColumnCount -ne $result.columnCount){throw 'ColumnCount readback mismatch'}
  $expected=@{0='7';1='Synthetic name';2='Synthetic role'}[$result.column]
  if($result.column -lt 3 -and $result.value -ne $expected){throw 'Unexpected projected column value'}
  if($result.column -eq 3 -and -not $result.isNull){throw 'Missing projection must be Null'}
 }
 $combo.Value=$null
 $empty=$app.Eval(('Forms![{0}]![EmployeeCombo].Column(1)' -f $name))
 if($null -ne $empty -and $empty -isnot [DBNull]){throw 'No selection must return Null'}
 $results|ConvertTo-Json -Depth 5
 Write-Output 'NO_SELECTION_NULL=True'

} finally {
 foreach($obj in @($combo,$form)){if($null -ne $obj){try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($obj)}catch{}}}
 if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db)}
 if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app)}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
 for($i=0;$i -lt 20 -and (Test-Path $path);$i++){try{Remove-Item -LiteralPath $path}catch{Start-Sleep -Milliseconds 250}}
 if(Test-Path $path){throw 'Oracle temporary database remains locked'}
 Write-Output 'TEMP_REMOVED=True'
}
