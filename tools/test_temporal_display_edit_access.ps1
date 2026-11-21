# Synthetic-only oracle: changing displayed text in a bound Access DateTime.
$ErrorActionPreference='Stop'
$path=Join-Path $env:TEMP ('codex_temporal_edit_'+[guid]::NewGuid().ToString('N')+'.accdb')
$app=$null;$db=$null;$form=$null;$field=$null;$other=$null;$rs=$null
try {
 $app=New-Object -ComObject Access.Application
 $app.NewCurrentDatabase($path)
 $db=$app.CurrentDb()
 $db.Execute('CREATE TABLE TemporalProbe (Id LONG PRIMARY KEY, Moment DATETIME)')
 $db.Execute('INSERT INTO TemporalProbe VALUES (1,#2024-08-09 08:09:10#)')
 $form=$app.CreateForm();$name=$form.Name;$form.RecordSource='TemporalProbe'
 $field=$app.CreateControl($name,109,0,'','Moment',100,100,2500,400);$field.Name='MomentEdit'
 $other=$app.CreateControl($name,109,0,'','',100,700,2500,400);$other.Name='FocusTarget'
 $app.DoCmd.Close(2,$name,1)
 foreach($obj in @($field,$other,$form)){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($obj)}
 $field=$null;$other=$null;$form=$null
 $app.DoCmd.OpenForm($name,0)
 $form=$app.Forms.Item($name);$field=$form.Controls.Item('MomentEdit');$other=$form.Controls.Item('FocusTarget')
 $results=@()
 foreach($case in @(@{format='Short Time';text=$null;expected='2024-08-09T08:09:10.0000000'},@{format='Short Time';text='11:22';expected='1899-12-30T11:22:00.0000000'},@{format='Short Date';text='10/08/2024';expected='2024-08-10T00:00:00.0000000'})) {
  $db.Execute('UPDATE TemporalProbe SET Moment=#2024-08-09 08:09:10# WHERE Id=1')
  $form.Requery();$field.Format=$case.format
  $before=([DateTime]$field.Value).ToString('yyyy-MM-ddTHH:mm:ss.fffffff')
  $field.SetFocus();if($null -ne $case.text){$field.Text=$case.text};$other.SetFocus()
  if($form.Dirty){$form.Dirty=$false}
  $rs=$db.OpenRecordset('SELECT Moment FROM TemporalProbe WHERE Id=1',4)
  $after=([DateTime]$rs.Fields.Item('Moment').Value).ToString('yyyy-MM-ddTHH:mm:ss.fffffff')
  $rs.Close();[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($rs);$rs=$null
  if($before -ne '2024-08-09T08:09:10.0000000' -or $after -ne $case.expected){throw 'Temporal display edit oracle differs from expected civil components'}
  $results+=@{format=$case.format;input=$case.text;before=$before;after=$after}
 }
 $results|ConvertTo-Json -Depth 4
} finally {
 if($rs){try{$rs.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($rs)}
 foreach($obj in @($field,$other,$form)){if($null -ne $obj){try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($obj)}catch{}}}
 if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db)}
 if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app)}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
 for($i=0;$i -lt 20 -and (Test-Path $path);$i++){try{Remove-Item -LiteralPath $path}catch{Start-Sleep -Milliseconds 250}}
 if(Test-Path $path){throw 'Oracle temporary database remains locked'}
 Write-Output 'TEMP_REMOVED=True'
}
