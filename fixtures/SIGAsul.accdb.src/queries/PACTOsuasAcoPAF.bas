Operation =1
Option =0
Where ="(((TbAcompDet.[PAF inicio]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="PACTOsuas"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="PACTOsuas.Identificação"
    Expression ="PACTOsuas.CRAS"
    Expression ="PACTOsuas.NOMECADUNICO"
    Expression ="PACTOsuas.NIS"
    Expression ="TbPessoa.SEXO"
    Expression ="PACTOsuas.DNASC"
    Expression ="PACTOsuas.CPF"
    Expression ="PACTOsuas.MAE"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="PACTOsuas"
    RightTable ="TbPessoa"
    Expression ="PACTOsuas.NOMECADUNICO = TbPessoa.Nome"
    Flag =1
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
    Flag =1
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="PACTOsuas.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOsuas.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOsuas.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOsuas.CPF"
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
    Begin
        dbText "Name" ="PACTOsuas.MAE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOsuas.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.SEXO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOsuas.NOMECADUNICO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-38
    Top =50
    Right =1088
    Bottom =534
    Left =-1
    Top =-1
    Right =1102
    Bottom =177
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =47
        Top =17
        Right =191
        Bottom =284
        Top =0
        Name ="PACTOsuas"
        Name =""
    End
    Begin
        Left =217
        Top =24
        Right =361
        Bottom =315
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =636
        Top =18
        Right =780
        Bottom =162
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =848
        Top =46
        Right =992
        Bottom =190
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
