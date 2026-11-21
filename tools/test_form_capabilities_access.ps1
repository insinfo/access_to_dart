# Synthetic-only SaveAsText/default oracle. No source application opened.
$ErrorActionPreference='Stop'
$dir=Join-Path $env:TEMP ('codex_form_caps_'+[guid]::NewGuid().ToString('N'))
[void](New-Item -ItemType Directory -Path $dir)
$app=$null;$form=$null
try {
 $app=New-Object -ComObject Access.Application
 $app.NewCurrentDatabase((Join-Path $dir 'probe.accdb'))
 $result=@()
 foreach($mode in @(0,1,2)) {
  $changed=$mode -ne 0
  $form=$app.CreateForm();$name=$form.Name
  if($changed){$form.AllowEdits=$false;$form.AllowAdditions=$false;$form.AllowDeletions=$false;$form.DataEntry=$true;$form.RecordsetType=$mode}
  $actual=@{}
  foreach($key in @('AllowEdits','AllowAdditions','AllowDeletions','DataEntry','RecordsetType')){$actual[$key]=$form.$key}
  $app.DoCmd.Close(2,$name,1)
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form);$form=$null
  $path=Join-Path $dir ($name+'.bas');$app.SaveAsText(2,$name,$path)
  $text=Get-Content -LiteralPath $path -Raw
  $raw=@{}
  foreach($key in @($actual.Keys)+@('AllowUpdating')){$m=[regex]::Match($text,'(?m)^\s*'+$key+'\s*=\s*([^\r\n]+)');$raw[$key]=if($m.Success){$m.Groups[1].Value.Trim()}else{$null}}
  if(-not $changed){
   if(-not $actual.AllowEdits -or -not $actual.AllowAdditions -or -not $actual.AllowDeletions -or $actual.DataEntry -or $actual.RecordsetType -ne 0){throw 'Unexpected form defaults'}
   foreach($key in $actual.Keys){if($null -ne $raw[$key]){throw "Default unexpectedly exported: $key"}}
  } else {
   foreach($key in @('AllowEdits','AllowAdditions','AllowDeletions','DataEntry')){if($raw[$key] -ne 'NotDefault'){throw "Unexpected toggled boolean export: $key"}}
   if($raw.AllowUpdating -ne [string]$mode -or $null -ne $raw.RecordsetType){throw 'Unexpected RecordsetType SaveAsText alias'}
  }
  $result+=@{recordsetMode=$mode;changed=$changed;actual=$actual;raw=$raw}
 }
 $result|ConvertTo-Json -Depth 5
 Write-Output 'FORM_CAPABILITY_DEFAULTS_OK'
} finally {
 if($form){try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($form)}catch{}}
 if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app)}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
 for($i=0;$i -lt 20 -and (Test-Path $dir);$i++){try{Remove-Item -LiteralPath $dir -Recurse -Force}catch{Start-Sleep -Milliseconds 250}}
 if(Test-Path $dir){throw 'Temporary oracle directory remains locked'}
 Write-Output 'TEMP_REMOVED=True'
}
