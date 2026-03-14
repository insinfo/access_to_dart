Operation =1
Option =2
Begin InputTables
    Name ="csCadTotalFamilias"
    Name ="PACTOrendaPCapitaNome"
End
Begin OutputColumns
    Expression ="csCadTotalFamilias.CodFam"
End
Begin Joins
    LeftTable ="csCadTotalFamilias"
    RightTable ="PACTOrendaPCapitaNome"
    Expression ="csCadTotalFamilias.Nome = PACTOrendaPCapitaNome.NOME"
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
Begin
    Begin
        dbText "Name" ="csCadTotalFamilias.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOrendaPCapita.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOrendaPCapitaNome.[RENDA MEDIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PACTOrendaPCapitaNome.NOME"
        dbInteger "ColumnWidth" ="2145"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1175
    Bottom =516
    Left =-1
    Top =-1
    Right =1107
    Bottom =101
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =67
        Top =18
        Right =211
        Bottom =203
        Top =0
        Name ="csCadTotalFamilias"
        Name =""
    End
    Begin
        Left =290
        Top =8
        Right =434
        Bottom =152
        Top =0
        Name ="PACTOrendaPCapitaNome"
        Name =""
    End
End
