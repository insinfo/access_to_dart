Operation =1
Option =2
Where ="(((TbSCFVExtDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbSCFVExtDetalhe"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="CadResidencia"
    Expression ="TbPessoa.CodFam = CadResidencia.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="CadResidencia.CodFam"
    Flag =0
End
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
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =2
    Top =32
    Right =441
    Bottom =562
    Left =-1
    Top =-1
    Right =415
    Bottom =190
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =322
        Top =22
        Right =466
        Bottom =289
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =127
        Top =7
        Right =271
        Bottom =288
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =514
        Top =12
        Right =658
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
