param([string]$InteractiveUser='isaque.santana',[string]$Repository='C:\MyDartProjects\access_to_dart',[string]$OutputDirectory='C:\MyDartProjects\access_to_dart\build\codex-report16-interactive')
$ErrorActionPreference='Stop'
$token=[guid]::NewGuid().ToString('N')
$task='CodexReport16Oracle_'+$token
$work=Join-Path $env:PUBLIC ('codex_report16_'+$token)
$out=Join-Path $work 'output';[IO.Directory]::CreateDirectory($out)|Out-Null
$ownedFile=Join-Path $out 'owned-process.json'
$registered=$false
try {
 & icacls $work /grant ($InteractiveUser+':(OI)(CI)M') /T /Q | Out-Null
 if($LASTEXITCODE -ne 0){throw 'Cannot grant access to the synthetic temporary folder'}
 $oracle=Join-Path $Repository 'tools\audit_report16_native.ps1'
 $source=Join-Path $Repository 'fixtures\SIGAsul.accdb.src'
 $log=Join-Path $out 'oracle.log'
 $launcher=Join-Path $work 'invoke.ps1'
 $body="`$ErrorActionPreference='Stop';try { & '$oracle' -SourceDirectory '$source' -OutputDirectory '$out' *> '$log';exit 0 } catch { `$_ | Out-File -LiteralPath '$log' -Append;exit 1 }"
 [IO.File]::WriteAllText($launcher,$body,[Text.UTF8Encoding]::new($false))
 $action=New-ScheduledTaskAction -Execute 'powershell.exe' -Argument ('-NoProfile -ExecutionPolicy Bypass -File "'+$launcher+'"') -WorkingDirectory $Repository
 $principal=New-ScheduledTaskPrincipal -UserId $InteractiveUser -LogonType Interactive -RunLevel Limited
 $settings=New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Minutes 3)
 Register-ScheduledTask -TaskName $task -Action $action -Principal $principal -Settings $settings | Out-Null
 $registered=$true
 Start-ScheduledTask -TaskName $task
 Write-Output 'INTERACTIVE_SYNTHETIC_ORACLE_STARTED=True'
 $deadline=[datetime]::UtcNow.AddMinutes(3)
 $started=$false
 do {
  Start-Sleep -Seconds 1
  $state=(Get-ScheduledTask -TaskName $task).State
  $info=Get-ScheduledTaskInfo -TaskName $task
  if($state -eq 'Running' -or $info.LastRunTime.Year -gt 2000){$started=$true}
  if($started -and $state -ne 'Running'){break}
 }while([datetime]::UtcNow -lt $deadline)
 if($state -eq 'Running'){throw 'Synthetic report oracle timeout'}
 [IO.Directory]::CreateDirectory($OutputDirectory)|Out-Null
 Copy-Item -Path (Join-Path $out '*') -Destination $OutputDirectory -Force
 Write-Output ('INTERACTIVE_TASK_RESULT='+$info.LastTaskResult)
 if(Test-Path $ownedFile){$owned=Get-Content $ownedFile -Raw|ConvertFrom-Json;Write-Output ('ACCESS_SESSION_ID='+$owned.sessionId)}
 if($info.LastTaskResult -ne 0){throw 'Interactive synthetic oracle failed; inspect private oracle.log'}
}finally{
 if($registered){try{if((Get-ScheduledTask -TaskName $task).State -eq 'Running'){Stop-ScheduledTask -TaskName $task}}finally{Unregister-ScheduledTask -TaskName $task -Confirm:$false}}
 if(Test-Path $ownedFile){
  $owned=Get-Content $ownedFile -Raw|ConvertFrom-Json
  $process=Get-Process -Id $owned.pid -ErrorAction SilentlyContinue
  if($process -and $process.Path -eq $owned.path -and $process.StartTime.ToUniversalTime().ToString('o') -eq $owned.startTimeUtc -and @($owned.existingPids) -notcontains $process.Id){Stop-Process -Id $process.Id -Force}
  $dbWork=[string]$owned.temporaryDatabaseDirectory
  if($dbWork -match '\\codex_report16_[0-9a-f]{32}$' -and (Test-Path $dbWork)){Remove-Item -LiteralPath $dbWork -Recurse -Force}
 }
 Remove-Item -LiteralPath $work -Recurse -Force
 Write-Output 'INTERACTIVE_TASK_AND_OWNED_TEMP_CLEANED=True'
}
