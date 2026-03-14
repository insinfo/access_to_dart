Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.VD)=Yes)"
    ")"
Begin InputTables
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Alias ="Mês de Referencia"
    Expression ="MonthName(Month([Data]))"
    Expression ="TbAtend.Nome"
    Expression ="TbAtend.VD"
    Expression ="TbAtend.VDLFR"
    Expression ="TbAtend.VDCDL"
    Expression ="TbAtend.VDDCP"
    Expression ="TbAtend.VDDPAF"
    Expression ="TbAtend.VDAMF"
    Expression ="TbAtend.VDFVI"
    Expression ="TbAtend.VDAMD"
    Expression ="TbAtend.VDASF"
    Expression ="TbAtend.VDPBF"
    Expression ="TbAtend.VDSCFV"
    Expression ="TbAtend.VDOUT"
    Expression ="TbAtend.[QUAL VD]"
    Expression ="TbAtend.[VD NAO LOCALIZADA]"
End
Begin OrderBy
    Expression ="TbAtend.Nome"
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
Begin
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.MULTIDISCIPLINAR"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1995"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[VD NAO LOCALIZADA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[QUAL VD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDOUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDLFR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDCDL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDCP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDFVI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDASF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Mês de Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AcolhidaPartic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Acolhida Coletiva]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-183
    Top =211
    Right =926
    Bottom =748
    Left =-1
    Top =-1
    Right =1085
    Bottom =106
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =263
        Top =10
        Right =519
        Bottom =266
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
