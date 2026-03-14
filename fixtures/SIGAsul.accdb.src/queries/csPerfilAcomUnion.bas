Operation =1
Option =0
Where ="(((TbAcompDet.[Motivo Deslig]) Is Null))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.[Fam Extrema Pb]"
    Expression ="TbAcomp.DataIncl"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcomp.CodFamilia"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbPessoa.ServAco"
    Expression ="TbAcompDet.Particular"
    Expression ="TbAcompDet.Coletivo"
    Expression ="TbAcompDet.Grupo"
    Expression ="TbAcompDet.Defic"
    Expression ="TbAcompDet.Idoso"
    Expression ="TbAcompDet.Gest"
    Expression ="TbAcompDet.Criança"
    Expression ="TbAcompDet.Adol"
    Expression ="TbAcompDet.[Alcool/Drogas]"
    Expression ="TbAcompDet.ConflitoFam"
    Expression ="TbAcompDet.FragilSocioEcon"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbAcompDet.[Motivo Deslig]"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
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
dbBoolean "TotalsRow" ="-1"
dbText "DatasheetFontName" ="Calibri"
dbInteger "DatasheetFontHeight" ="8"
dbInteger "DatasheetFontWeight" ="400"
dbBoolean "DatasheetFontItalic" ="0"
dbBoolean "DatasheetFontUnderline" ="0"
dbByte "TabularCharSet" ="0"
dbByte "TabularFamily" ="34"
dbLong "DatasheetForeColor" ="0"
dbLong "DatasheetForeColor12" ="0"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="CadResidencia.[Fam Extrema Pb]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.ServAco"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAcompDet.Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodFamilia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1100
    Bottom =549
    Left =-1
    Top =-1
    Right =1076
    Bottom =246
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =30
        Top =21
        Right =174
        Bottom =247
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =197
        Top =14
        Right =341
        Bottom =285
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =447
        Top =17
        Right =591
        Bottom =238
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =610
        Top =23
        Right =754
        Bottom =285
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
