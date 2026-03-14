Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbPessoa.DataDes"
    "ligPes) Is Null Or (TbPessoa.DataDesligPes)>=[DATA FINAL]))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="CadResidencia.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.MulherCF"
    Expression ="TbPessoa.BPCD"
    Expression ="TbPessoa.BPCI"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.CADUNICO"
    Expression ="CadResidencia.[Outros Programas Priori]"
    Expression ="CadResidencia.[Fam Extrema Pb]"
    Expression ="CadResidencia.[Area de risco]"
    Expression ="CadResidencia.[Area violencia]"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
Begin
    Begin
        dbText "Name" ="CadResidencia.[Fam Extrema Pb]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MulherCF"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.CADUNICO"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Outros Programas Priori]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area de risco]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area violencia]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCD"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCI"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =0
    Left =33
    Top =36
    Right =1136
    Bottom =433
    Left =-1
    Top =-1
    Right =1079
    Bottom =97
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =113
        Top =19
        Right =250
        Bottom =321
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =285
        Top =14
        Right =496
        Bottom =285
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =544
        Top =12
        Right =688
        Bottom =326
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
