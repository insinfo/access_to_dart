# Controlled DAO/Access oracle; no real SIGAsul database is opened.
$ErrorActionPreference='Stop'
$path=Join-Path $env:TEMP ('codex_mv_write_'+[guid]::NewGuid().ToString('N')+'.accdb')
$app=$null;$db=$null;$rs=$null;$child=$null;$form=$null;$combo=$null;$table=$null;$field=$null
function Values($recordset){
 $items=@();if(-not ($recordset.BOF -and $recordset.EOF)){$recordset.MoveFirst();while(-not $recordset.EOF){$v=$recordset.Fields.Item('Value').Value;$items+=if($null -eq $v -or $v -is [DBNull]){$null}else{[string]$v};$recordset.MoveNext()}}
 return ,$items
}
try{
 $app=New-Object -ComObject Access.Application;$app.NewCurrentDatabase($path);$db=$app.CurrentDb()
 $table=$db.CreateTableDef('Parents');$table.Fields.Append($table.CreateField('ID',4));$field=$table.CreateField('Choices',109);$table.Fields.Append($field);$db.TableDefs.Append($table)
 $db.Execute('INSERT INTO Parents(ID) VALUES(1)');$db.Execute('INSERT INTO Parents(ID) VALUES(2)')
 $rs=$db.OpenRecordset('SELECT * FROM Parents WHERE ID=1',2);$child=$rs.Fields.Item('Choices').Value
 $results=@();foreach($case in @(@{name='first';value='ONE'},@{name='duplicate';value='ONE'},@{name='case_duplicate';value='one'},@{name='second';value='TWO'},@{name='outside_list_DAO';value='OUTSIDE'},@{name='COM_DBNull_assignment';value=[DBNull]::Value},@{name='variant_empty';value=$null},@{name='empty_text';value=''})){
  $errorNumber=$null;$message=$null;$accepted=$false
  try{$rs.Edit();try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($child)}catch{};$child=$rs.Fields.Item('Choices').Value;$child.AddNew();$child.Fields.Item('Value').Value=$case.value;$child.Update();$rs.Update();$accepted=$true}catch{$errorNumber=$_.Exception.HResult;$message=$_.Exception.Message;try{$child.CancelUpdate()}catch{};try{$rs.CancelUpdate()}catch{}}
  try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($child)}catch{};$child=$rs.Fields.Item('Choices').Value
  $results+=@{scenario=$case.name;accepted=$accepted;hresult=$errorNumber;message=$message;values=(Values $child)}
 }
 $rs.Edit();try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($child)}catch{};$child=$rs.Fields.Item('Choices').Value;if(-not ($child.BOF -and $child.EOF)){$child.MoveFirst()};while(-not $child.EOF){$child.Delete();$child.MoveNext()};$rs.Update();try{$child.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($child);$child=$null;$rs.Close();[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($rs);$rs=$null
 $rs=$db.OpenRecordset('SELECT * FROM Parents WHERE ID=1',2);$child=$rs.Fields.Item('Choices').Value;$emptyAfterDelete=Values $child
 $form=$app.CreateForm();$name=$form.Name;$form.RecordSource='Parents';$combo=$app.CreateControl($name,111,0,'','Choices',100,100,2000,300);$combo.Name='ChoicesCombo';$combo.RowSourceType='Value List';$combo.RowSource='"ONE";"TWO"';$combo.LimitToList=$true
 $properties=@{LimitToList=[bool]$combo.LimitToList;ColumnCount=[int]$combo.ColumnCount;fieldIsComplex=[bool]$rs.Fields.Item('Choices').IsComplex;emptyAfterDelete=$emptyAfterDelete.Count}
 $app.DoCmd.Close(2,$name,2)
 if(-not $results[0].accepted -or $results[1].accepted -or $results[2].accepted -or -not $results[3].accepted -or -not $results[4].accepted -or $emptyAfterDelete.Count -ne 0){throw 'Multivalue oracle contract changed'}
 @{scenarios=$results;properties=$properties;nativeNull="Not established: COM DBNull coercion is not a DAO NULL oracle"}|ConvertTo-Json -Depth 8
}finally{
 if($app -and $name){try{$app.DoCmd.Close(2,$name,2)}catch{}}
 foreach($obj in @($child,$rs)){if($null -ne $obj){try{$obj.Close()}catch{}}}
 foreach($obj in @($combo,$form,$child,$rs,$field,$table)){if($null -ne $obj){try{[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($obj)}catch{}}}
 if($db){try{$db.Close()}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($db)}
 if($app){try{$app.CloseCurrentDatabase()}catch{};try{$app.Quit(2)}catch{};[void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($app)}
 [GC]::Collect();[GC]::WaitForPendingFinalizers();[GC]::Collect();for($i=0;$i -lt 20 -and (Test-Path $path);$i++){try{Remove-Item -LiteralPath $path}catch{Start-Sleep -Milliseconds 250}};if(Test-Path $path){throw 'Oracle file remains locked'};Write-Output 'TEMP_REMOVED=True'
}
