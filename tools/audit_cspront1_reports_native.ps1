param([string]$SourceDirectory='fixtures/SIGAsul.accdb.src',[Parameter(Mandatory=$true)][string]$OutputDirectory)
$ErrorActionPreference='Stop'
$reportNames=@('prontuario1','prontuario4-Condi-Habit','prontuario6-Condi-SAUDE-TEXTO','prontuario11-violenc-violacoes-fr-verso','prontuario16-REGISTRO-SINTETICO-FR-VERSO')
$imagePath=(Resolve-Path (Join-Path $SourceDirectory 'images/logo-SUAS-ICON.png')).Path
$themePath=(Resolve-Path (Join-Path $SourceDirectory 'themes/Tema do Office.thmx')).Path
$out=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputDirectory)
[IO.Directory]::CreateDirectory($out)|Out-Null
$work=Join-Path ([IO.Path]::GetTempPath()) ('codex_report16_'+[guid]::NewGuid().ToString('N'))
[IO.Directory]::CreateDirectory($work)|Out-Null
$path=Join-Path $work 'synthetic.accdb'
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
 $db.Execute('CREATE TABLE TbUnidade (CodUnidade LONG, [Nº UNIDADE] TEXT(50), NOME TEXT(255))')
 $db.Execute(@"
CREATE TABLE CadResidencia (
  CodFam LONG,
  CodResid LONG,
  CRAS YESNO,
  [CRAS Origem] LONG,
  [Resid Propria] YESNO, [Resid Alugada] YESNO, [Resid Cedida] YESNO, [Resid Ocupada] YESNO,
  [Alvenaria/madeira aparelhada] YESNO, [Madeira aproveitada/taipa/outros] YESNO,
  [Medidor proprio] YESNO, [Medidor compart] YESNO, [Sem Medidor] YESNO, [Sem energia eletrica] YESNO,
  [Agua canalizada] YESNO, [Abast Rede geral] YESNO, [Poço/Nascente] YESNO, [Cisterna/Captação] YESNO,
  [Carro pipa] YESNO, [Outra forma abast] YESNO,
  [Rede Coletora esgoto] YESNO, [Fossa septica] YESNO, [Fossa rudimentar] YESNO, [Vala Rio Lago] YESNO, [Sem banheiro] YESNO,
  [Coleta lixo direta] YESNO, [Coleta lixo indireta] YESNO, [Sem Coleta lixo] YESNO,
  [Nº Comodos] LONG, [Nº Dormitorios] LONG, [Nº pessoas/Dormitorio] LONG,
  [Domicilio tem acessib total] YESNO, [Domicilio tem acessib interno] YESNO, [Domicilio sem acessib] YESNO,
  [Area de risco] YESNO, [Area dif acesso geografico] YESNO, [Area violencia] YESNO
)
"@)
 $db.Execute('CREATE TABLE TbPessoa (CodPessoa LONG, CodFam LONG, NOME TEXT(255))')
 $db.Execute("INSERT INTO TbUnidade VALUES (1, 'UNIDADE-01', 'UNIDADE SINTETICA')")
 $db.Execute("INSERT INTO CadResidencia VALUES (4242, 4242, -1, 1, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 5, 2, 2, 0, -1, 0, 0, 0, -1)")
 $db.Execute("INSERT INTO TbPessoa VALUES (10, 4242, 'FAMILIA SINTETICA - TESTE DE FIDELIDADE')")
 [void]$db.CreateQueryDef('CSPRONT1','SELECT CadResidencia.*, TbPessoa.NOME, TbUnidade.NOME, TbUnidade.[Nº UNIDADE] FROM (TbUnidade INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]) INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam')
 [void]$app.CurrentProject.AddSharedImage('logo-SUAS-ICON',$imagePath)
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
 function SetDaoProperty($database,[string]$propName,[int]$propType,$propValue){
  $found=$false
  foreach($p in $database.Properties){if($p.Name -eq $propName){$p.Value=$propValue;$found=$true;break}}
  if(-not $found){$database.Properties.Append($database.CreateProperty($propName,$propType,$propValue))}
 }
 SetDaoProperty $db 'Theme Resource Name' 10 $themeName
 SetDaoProperty $db 'Themed Form Controls' 4 1
 $db.Close();[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null
 $app.CloseCurrentDatabase();$app.OpenCurrentDatabase($path);$db=$app.CurrentDb()

 $reportEntries=@()
 foreach($name in $reportNames){
  $source=(Resolve-Path (Join-Path $SourceDirectory ('reports/'+$name+'.bas'))).Path
  $text=Get-Content -LiteralPath $source -Raw -Encoding UTF8
  if($text -match '(?im)^\s*(CodeBehindForm|On[A-Z]\w*\s*=|Begin BreakLevel)' -or $text -match '(?im)^\s*HasModule\s*=') {throw "Oracle accepts only event-free, group-free exported reports: $name"}
  $reportTextPath=Join-Path $work ($name+'.txt')
  [IO.File]::WriteAllText($reportTextPath,$text,[Text.Encoding]::Unicode)
  $app.LoadFromText(3,$name,$reportTextPath)
  $app.DoCmd.OpenReport($name,1)
  $report=$app.Reports.Item($name)
  $controls=@()
  foreach($control in $report.Controls){
   $controls += [pscustomobject]@{name=$control.Name;controlType=$control.ControlType;section=$control.Section;properties=(PropertyMap $control @('Name','ControlType','Section','Left','Top','Width','Height','Visible','Caption','ControlSource','ColumnCount','BoundColumn','ColumnWidths','FontName','FontSize','FontWeight','ForeColor','BackColor','BackStyle','BorderColor','BorderStyle','BorderWidth','TextAlign','Picture','PictureType','SizeMode'))}
  }
  $reportEntries += [pscustomobject]@{reportName=$name;sourceSha256=(Get-FileHash $source -Algorithm SHA256).Hash.ToLowerInvariant();width=$report.Width;controls=$controls}
  $app.DoCmd.Close(3,$name,1);[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($report);$report=$null
  Write-Output ("ORACLE_REPORT=$name CONTROLS="+$controls.Count)
 }

 $app.DoCmd.OpenReport('prontuario1',2)
 $nativeTemp1=Join-Path $work 'report1.pdf'
 $app.DoCmd.OutputTo(3,'prontuario1','PDF Format (*.pdf)',$nativeTemp1,$false,[Type]::Missing,[Type]::Missing,0)
 Copy-Item -LiteralPath $nativeTemp1 -Destination (Join-Path $out 'report1.pdf') -Force
 $app.DoCmd.Close(3,'prontuario1',2)

 $app.DoCmd.OpenReport('prontuario4-Condi-Habit',2)
 $nativeTemp=Join-Path $work 'report4.pdf'
 $app.DoCmd.OutputTo(3,'prontuario4-Condi-Habit','PDF Format (*.pdf)',$nativeTemp,$false,[Type]::Missing,[Type]::Missing,0)
 Copy-Item -LiteralPath $nativeTemp -Destination (Join-Path $out 'report4.pdf') -Force
 $app.DoCmd.Close(3,'prontuario4-Condi-Habit',2)

 $result=[pscustomobject]@{contract='cspront1-multi-native-presentation-v1';accessSessionId=$ownedProcess.SessionId;syntheticOnly=$true;originalDatabaseOpened=$false;reports=$reportEntries;report1PdfSha256=(Get-FileHash (Join-Path $out 'report1.pdf') -Algorithm SHA256).Hash.ToLowerInvariant();report4PdfSha256=(Get-FileHash (Join-Path $out 'report4.pdf') -Algorithm SHA256).Hash.ToLowerInvariant()}
 [IO.File]::WriteAllText((Join-Path $out 'cspront1-multi-presentation.json'),($result|ConvertTo-Json -Depth 12),[Text.UTF8Encoding]::new($false))
 Write-Output 'MULTI_ORACLE_PDF_EXPORTED=True'
}catch{Write-Output ('ORACLE_ERROR_HRESULT='+$_.Exception.HResult);throw}finally{
 if($printer){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($printer);$printer=$null}
 if($report){[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($report);$report=$null}
 if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db);$db=$null}
 if($app){if($ownsAccess){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{}};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app);$app=$null}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect()
 for($attempt=0;$attempt -lt 20 -and (Test-Path $work);$attempt++){try{Remove-Item -LiteralPath $work -Recurse -Force}catch{Start-Sleep -Milliseconds 250}}
 if(Test-Path $work){throw 'Temporary report oracle remained locked'}
}
