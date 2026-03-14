dbMemo "SQL" ="SELECT TOP 50 [contar Composição Familiar].CodFam, [contar Composição Familiar]."
    "ContarDeNome, [filtro composição].Nome, [filtro composição].Parentesco, [filtro "
    "composição].Idade\015\012FROM [filtro composição] INNER JOIN [contar Composição "
    "Familiar] ON [filtro composição].CodFam = [contar Composição Familiar].CodFam\015"
    "\012WHERE ((([filtro composição].DNasc) Is Not Null) AND (([filtro composição].I"
    "dade) Between 4 And 6))\015\012ORDER BY [filtro composição].Idade;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[filtro composição casa da criança].[ContarDeNome] DESC"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="[filtro composição].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[filtro composição].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[contar Composição Familiar].ContarDeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[contar Composição Familiar].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[filtro composição].Nome"
        dbLong "AggregateType" ="-1"
    End
End
