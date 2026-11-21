# Synthetic Access bound-control oracle; never opens production data.
$ErrorActionPreference='Stop'
$path=Join-Path $env:TEMP ('codex_double_pk_'+[guid]::NewGuid().ToString('N')+'.accdb')
$app=$null;$db=$null;$form=$null;$field=$null;$other=$null;$rs=$null
try {
 $app=New-Object -ComObject Access.Application
 $app.NewCurrentDatabase($path);$db=$app.CurrentDb()
 $db.Execute('CREATE TABLE DoubleProbe (Id DOUBLE PRIMARY KEY, Label TEXT(50))')
 $db.Execute("INSERT INTO DoubleProbe VALUES (1.25,'synthetic')")
 $form=$app.CreateForm();$name=$form.Name;$form.RecordSource='DoubleProbe'
 $field=$app.CreateControl($name,109,0,'','Id',100,100,2500,400);$field.Name='KeyEdit'
 $other=$app.CreateControl($name,109,0,'','Label',100,700,2500,400);$other.Name='FocusTarget'
 $app.DoCmd.Close(2,$name,1)
 foreach($obj in @($field,$other,$form)){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($obj)}
 $field=$null;$other=$null;$form=$null
 $app.DoCmd.OpenForm($name,0);$form=$app.Forms.Item($name)
 $field=$form.Controls.Item('KeyEdit');$other=$form.Controls.Item('FocusTarget')
 if([double]$field.Value -ne 1.25){throw 'Unexpected initial synthetic key'}
 $field.SetFocus();$field.Text=([double]3.75).ToString([Globalization.CultureInfo]::CurrentCulture);$other.SetFocus()
 if($form.Dirty){$form.Dirty=$false}
 $rs=$db.OpenRecordset('SELECT Id,Label FROM DoubleProbe',4)
 if([double]$rs.Fields.Item('Id').Value -ne 3.75 -or $rs.Fields.Item('Label').Value -ne 'synthetic'){throw 'Bound Double primary key edit did not persist'}
 Write-Output 'DOUBLE_PK_BOUND_EDIT_OK 1.25 -> 3.75'
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
