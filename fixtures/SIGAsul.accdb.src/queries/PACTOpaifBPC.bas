dbMemo "SQL" ="SELECT TbAcomp.Nome, csPBFDistinct.TITULAR, TbAcompDet.[PAF inicio], TbAcompDet."
    "DataDesl\015\012FROM (csPBFDistinct INNER JOIN TbPessoa ON csPBFDistinct.TITULAR"
    " = TbPessoa.Nome) INNER JOIN (TbAcomp INNER JOIN TbAcompDet ON TbAcomp.CodAcomp "
    "= TbAcompDet.CodAcomp) ON TbPessoa.CodPessoa = TbAcomp.Nome\015\012WHERE (((TbAc"
    "ompDet.[PAF inicio]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null));\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="csPBFDistinct.TITULAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
End
