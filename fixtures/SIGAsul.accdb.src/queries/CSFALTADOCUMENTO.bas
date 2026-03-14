Operation =1
Option =0
Where ="(((TbPessoa.PROVICN)=Yes)) OR (((TbPessoa.PROVIRG)=Yes)) OR (((TbPessoa.PROVICTP"
    "S)=Yes)) OR (((TbPessoa.PROVICPF)=Yes)) OR (((TbPessoa.PROVITE)=Yes))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.PROVICN"
    Expression ="TbPessoa.PROVIRG"
    Expression ="TbPessoa.PROVICTPS"
    Expression ="TbPessoa.PROVICPF"
    Expression ="TbPessoa.PROVITE"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbText "DatasheetFontName" ="Calibri"
dbInteger "DatasheetFontHeight" ="7"
dbInteger "DatasheetFontWeight" ="700"
dbBoolean "DatasheetFontItalic" ="0"
dbBoolean "DatasheetFontUnderline" ="0"
dbByte "TabularCharSet" ="0"
dbByte "TabularFamily" ="34"
dbLong "DatasheetForeColor" ="0"
dbLong "DatasheetForeColor12" ="0"
dbBoolean "TotalsRow" ="-1"
dbMemo "OrderBy" ="[CSFALTADOCUMENTO].[Nome]"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="2340"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="990"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVICN"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1050"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1140"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVICTPS"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1020"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVIRG"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVICPF"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="960"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVITE"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1020"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="915"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="765"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1005"
        dbBoolean "ColumnHidden" ="0"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1116
    Bottom =685
    Left =-1
    Top =-1
    Right =1151
    Bottom =88
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =322
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
