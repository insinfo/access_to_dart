param([string]$SourceDirectory='fixtures/SIGAsul.accdb.src',[Parameter(Mandatory=$true)][string]$OutputDirectory)
$ErrorActionPreference='Stop'
$name='prontuario16-REGISTRO-SINTETICO-FR-VERSO'
$source=(Resolve-Path (Join-Path $SourceDirectory ('reports/'+$name+'.bas'))).Path
$settingsPath=(Resolve-Path (Join-Path $SourceDirectory ('reports/'+$name+'.json'))).Path
$imagePath=(Resolve-Path (Join-Path $SourceDirectory 'images/logo-SUAS-ICON.png')).Path
$themePath=(Resolve-Path (Join-Path $SourceDirectory 'themes/Tema do Office.thmx')).Path
$text=Get-Content -LiteralPath $source -Raw -Encoding UTF8
if($text -match '(?im)^\s*(CodeBehindForm|On[A-Z]\w*\s*=|Begin BreakLevel)' -or $text -match '(?im)^\s*HasModule\s*=') {throw 'Oracle accepts only the event-free, group-free exported report'}
$settings=Get-Content -LiteralPath $settingsPath -Raw -Encoding UTF8|ConvertFrom-Json
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputDirectory)
[IO.Directory]::CreateDirectory($out)|Out-Null
$work=Join-Path ([IO.Path]::GetTempPath()) ('codex_report16_'+[guid]::NewGuid().ToString('N'))
[IO.Directory]::CreateDirectory($work)|Out-Null
$path=Join-Path $work 'synthetic.accdb'
$reportTextPath=Join-Path $work 'report.txt';[IO.File]::WriteAllText($reportTextPath,$text,[Text.Encoding]::Unicode)
$app=$null;$db=$null;$report=$null;$printer=$null;$ownsAccess=$false
Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public static class ReportOracleWindow { [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr hWnd,out uint pid); }'
$existingAccess=@(Get-Process MSACCESS -ErrorAction SilentlyContinue|ForEach-Object {$_.Id})
function PropertyMap($object,[string[]]$names){
 $map=[ordered]@{}
 foreach($property in $names){
  try{$value=$object.Properties.Item($property).Value;$map[$property]=[pscustomobject]@{available=$true;value=$value}}
  catch{$map[$property]=[pscustomobject]@{available=$false;error='Property unavailable'}}
 }
 return $map
}
try {
 $app=New-Object -ComObject Access.Application
 [uint32]$createdAccessPid=0
 [void][ReportOracleWindow]::GetWindowThreadProcessId([IntPtr]$app.hWndAccessApp(),[ref]$createdAccessPid)
 if($createdAccessPid -eq 0 -or $existingAccess -contains $createdAccessPid){
  [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app);$app=$null
  throw 'Access reused an existing process; oracle aborted before database creation'
 }
 $ownedProcess=Get-Process -Id $createdAccessPid
 $ownsAccess=$true
 [IO.File]::WriteAllText((Join-Path $out 'owned-process.json'),(@{pid=$createdAccessPid;startTimeUtc=$ownedProcess.StartTime.ToUniversalTime().ToString('o');path=$ownedProcess.Path;sessionId=$ownedProcess.SessionId;existingPids=$existingAccess;temporaryDatabaseDirectory=$work}|ConvertTo-Json),[Text.UTF8Encoding]::new($false))
 $app.NewCurrentDatabase($path)
 $db=$app.CurrentDb()
 $db.Execute('CREATE TABLE SyntheticFamilies (CodFam LONG)')
 $db.Execute('CREATE TABLE TbPessoa (NOME TEXT(255))')
 $db.Execute('CREATE TABLE TbUnidade (NOME TEXT(255))')
 $db.Execute('INSERT INTO SyntheticFamilies VALUES (4242)')
 $db.Execute("INSERT INTO TbPessoa VALUES ('FAMILIA SINTETICA - TESTE DE FIDELIDADE')")
 $db.Execute("INSERT INTO TbUnidade VALUES ('UNIDADE SINTETICA')")
 [void]$db.CreateQueryDef('CSPRONT1','SELECT SyntheticFamilies.CodFam, TbPessoa.NOME, TbUnidade.NOME FROM SyntheticFamilies, TbPessoa, TbUnidade')
 $probe=$db.OpenRecordset('CSPRONT1',4);$queryFields=@();foreach($field in $probe.Fields){$queryFields+=$field.Name};$probe.Close()
 [void]$app.CurrentProject.AddSharedImage('logo-SUAS-ICON',$imagePath)
 # Recreate the exported theme in this disposable database only. The original
 # export uses the VCS shared-resource attachment representation.
 $themeName=[IO.Path]::GetFileNameWithoutExtension($themePath)
 $themeRecords=$db.OpenRecordset(('SELECT * FROM MSysResources WHERE [Type]=''thmx'' AND [Name]='''+$themeName.Replace("'","''")+''''),2)
 try {
  if($themeRecords.EOF){$themeRecords.AddNew();$themeRecords.Fields.Item('Name').Value=$themeName;$themeRecords.Fields.Item('Extension').Value='thmx';$themeRecords.Fields.Item('Type').Value='thmx'}else{$themeRecords.Edit()}
  $themeData=$themeRecords.Fields.Item('Data').Value
  try {
   while(-not $themeData.EOF){$themeData.Delete();$themeData.MoveNext()}
   $themeData.AddNew();$themeData.Fields.Item('FileData').LoadFromFile($themePath);$themeData.Update()
  }finally{$themeData.Close()}
  $themeRecords.Update()
 }finally{$themeRecords.Close()}
 # Set DAO database theme properties matching exported database properties.
 function SetDaoProperty($database,[string]$propName,[int]$propType,$propValue){
  $found=$false
  foreach($p in $database.Properties){
   if($p.Name -eq $propName){$p.Value=$propValue;$found=$true;break}
  }
  if(-not $found){
   $newProp=$database.CreateProperty($propName,$propType,$propValue)
   $database.Properties.Append($newProp)
  }
 }
 SetDaoProperty $db 'Theme Resource Name' 10 $themeName
 SetDaoProperty $db 'Themed Form Controls' 4 1
 # Reload the temporary database so Access resolves theme defaults from it.
 $db.Close();[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null
 $app.CloseCurrentDatabase();$app.OpenCurrentDatabase($path);$db=$app.CurrentDb()
 $dbThemeResourceName=$null
 try{$dbThemeResourceName=$db.Properties.Item('Theme Resource Name').Value}catch{}
 $app.LoadFromText(3,$name,$reportTextPath)
 $app.DoCmd.OpenReport($name,1)
 $report=$app.Reports.Item($name)
 $printer=$report.Printer
 # These are persisted report settings from the companion export, not machine defaults.
 $printer.Orientation=1;$printer.PaperSize=9
 foreach($pair in @(@('LeftMargin','LeftMargin'),@('RightMargin','RightMargin'),@('TopMargin','TopMargin'),@('BottomMargin','BotMargin'))){
  $printer.($pair[0])=[int][Math]::Round([double]$settings.Items.Margins.($pair[1])*1440)
 }
 $reportProps=PropertyMap $report @('Width','RecordSource','HasModule','Picture','PictureType','PictureAlignment','PictureSizeMode','PictureTiling','PageHeader','PageFooter','GrpKeepTogether','FitToPage','FastLaserPrinting','OnOpen','OnLoad','OnNoData','OnPage','ThemeResourceName')
 $sectionProps=@();foreach($sectionIndex in @(0,3,4)){$section=$report.Section($sectionIndex)
  $sectionProps += [pscustomobject]@{name=$section.Name;properties=(PropertyMap $section @('Name','Height','Visible','CanGrow','CanShrink','KeepTogether','ForceNewPage','NewRowOrCol','BackColor','AlternateBackColor','OnFormat','OnPrint','OnRetreat'))}
 }
 $controls=@()
 foreach($control in $report.Controls){
  $controls += [pscustomobject]@{name=$control.Name;controlType=$control.ControlType;section=$control.Section;properties=(PropertyMap $control @('Name','ControlType','Section','Left','Top','Width','Height','Visible','Caption','ControlSource','FontName','FontSize','FontWeight','FontItalic','FontUnderline','ForeColor','BackColor','BackStyle','BorderColor','BorderStyle','BorderWidth','TextAlign','Vertical','LeftMargin','RightMargin','TopMargin','BottomMargin','LineSpacing','CanGrow','CanShrink','HideDuplicates','ReadingOrder','TextFormat','Picture','PictureType','SizeMode','PictureAlignment','PictureTiling','OnClick'))}
 }
 $printProps=[ordered]@{};foreach($property in @('DeviceName','Orientation','PaperSize','LeftMargin','RightMargin','TopMargin','BottomMargin','ItemSizeWidth','ItemSizeHeight','DefaultSize','Columns','ColumnSpacing','RowSpacing','DataOnly')) {
  try{$printProps[$property]=[pscustomobject]@{available=$true;value=$printer.$property}}catch{$printProps[$property]=[pscustomobject]@{available=$false;error='Property unavailable'}}
 }
 $result=[pscustomobject]@{queryFields=$queryFields;contract='report16-native-presentation-v1';pdfExported=$false;accessSessionId=$ownedProcess.SessionId;reportName=$name;sourceSha256=(Get-FileHash $source -Algorithm SHA256).Hash.ToLowerInvariant();printSettingsSha256=(Get-FileHash $settingsPath -Algorithm SHA256).Hash.ToLowerInvariant();themeSha256=(Get-FileHash $themePath -Algorithm SHA256).Hash.ToLowerInvariant();themeImportedIntoTemporaryDatabase=$true;databaseThemeResourceName=$dbThemeResourceName;sharedImageSha256=(Get-FileHash $imagePath -Algorithm SHA256).Hash.ToLowerInvariant();accessVersion=$app.Version;syntheticOnly=$true;originalDatabaseOpened=$false;printerJobSubmitted=$false;report=$reportProps;sections=$sectionProps;controls=$controls;printer=$printProps;syntheticRows=@(@{CodFam=4242;'TbPessoa.NOME'='FAMILIA SINTETICA - TESTE DE FIDELIDADE'})}
 [IO.File]::WriteAllText((Join-Path $out 'presentation.json'),($result|ConvertTo-Json -Depth 12),[Text.UTF8Encoding]::new($false))
 $app.DoCmd.Close(3,$name,1);[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($report);$report=$null
 Write-Output ('QUERY_FIELDS='+($queryFields -join '|'))
 $app.DoCmd.OpenReport($name,2)
 Write-Output 'PREVIEW_OPENED=True'
 $nativeTemp=Join-Path $work 'native.pdf'
 $app.DoCmd.OutputTo(3,$name,'PDF Format (*.pdf)',$nativeTemp,$false,[Type]::Missing,[Type]::Missing,0)
 Copy-Item -LiteralPath $nativeTemp -Destination (Join-Path $out 'native.pdf') -Force
 $app.DoCmd.Close(3,$name,2)
 $result.pdfExported=$true
 $result|Add-Member -NotePropertyName nativePdfSha256 -NotePropertyValue (Get-FileHash (Join-Path $out 'native.pdf') -Algorithm SHA256).Hash.ToLowerInvariant()
 [IO.File]::WriteAllText((Join-Path $out 'presentation.json'),($result|ConvertTo-Json -Depth 12),[Text.UTF8Encoding]::new($false))
 Write-Output ('NATIVE_REPORT_CONTROLS='+$controls.Count+' PDF_EXPORTED=True')
}catch{Write-Output ('ORACLE_ERROR_HRESULT='+$_.Exception.HResult);throw}finally{
 if($printer){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($printer);$printer=$null}
 if($report){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($report);$report=$null}
 if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null}
 if($app){if($ownsAccess){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{}};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app);$app=$null}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
 for($attempt=0;$attempt -lt 20 -and (Test-Path $work);$attempt++){try{Remove-Item -LiteralPath $work -Recurse -Force}catch{Start-Sleep -Milliseconds 250}}
 if(Test-Path $work){throw 'Temporary report oracle remained locked'}
}
