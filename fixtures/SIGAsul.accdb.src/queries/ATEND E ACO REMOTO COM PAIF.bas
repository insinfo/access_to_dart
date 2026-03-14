Operation =1
Option =0
Where ="((([ATENDIMENTO E ACO REMOTO].Data) Between [DATA INICIAL] And [DATA FINAL]) AND"
    " ((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>[DATA FINAL]))"
Begin InputTables
    Name ="TbAcompDet"
    Name ="TbAcomp"
    Name ="ATENDIMENTO E ACO REMOTO"
End
Begin OutputColumns
    Expression ="[ATENDIMENTO E ACO REMOTO].Data"
    Expression ="TbAcomp.Volante"
    Expression ="[ATENDIMENTO E ACO REMOTO].Nome"
    Expression ="[ATENDIMENTO E ACO REMOTO].DNasc"
    Expression ="[ATENDIMENTO E ACO REMOTO].AtRemoto"
    Expression ="[ATENDIMENTO E ACO REMOTO].Acoremoto"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="TbAcompDet"
    RightTable ="TbAcomp"
    Expression ="TbAcompDet.CodAcomp = TbAcomp.CodAcomp"
    Flag =1
    LeftTable ="ATENDIMENTO E ACO REMOTO"
    RightTable ="TbAcomp"
    Expression ="[ATENDIMENTO E ACO REMOTO].CodPessoa = TbAcomp.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="[ATENDIMENTO E ACO REMOTO].Data"
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
dbBoolean "TotalsRow" ="-1"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].Data"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1245"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].AtRemoto"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1170"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].DNasc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3405"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1665"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].Acoremoto"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1155"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[ATENDIMENTO E ACO REMOTO].CodAtend"
        dbInteger "ColumnWidth" ="630"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-99
    Top =18
    Right =1055
    Bottom =589
    Left =-1
    Top =-1
    Right =1130
    Bottom =221
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =796
        Top =40
        Right =1111
        Bottom =351
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =440
        Top =10
        Right =584
        Bottom =208
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =107
        Top =22
        Right =332
        Bottom =355
        Top =0
        Name ="ATENDIMENTO E ACO REMOTO"
        Name =""
    End
End
