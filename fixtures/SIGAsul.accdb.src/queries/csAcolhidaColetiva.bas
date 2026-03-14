Operation =1
Option =0
Where ="(((TbAcolhidaCol.DataAcoCol) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbNo"
    "meAcolhida.Nome) Is Not Null))"
Begin InputTables
    Name ="TbAcolhidaCol"
    Name ="TbNomeAcolhida"
    Name ="TbCadFuncionario"
End
Begin OutputColumns
    Expression ="TbAcolhidaCol.CodAcolhidaCol"
    Expression ="TbAcolhidaCol.DataAcoCol"
    Expression ="TbCadFuncionario.Nome"
    Alias ="ESPECIALIDADE"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Expression ="TbNomeAcolhida.Nome"
    Expression ="TbAcolhidaCol.DNascAcoCol"
    Expression ="TbAcolhidaCol.cpfAcoCol"
    Expression ="TbAcolhidaCol.rgAcoCol"
    Expression ="TbAcolhidaCol.celAcoCol"
    Expression ="TbAcolhidaCol.demBPCAcoCol"
    Expression ="TbAcolhidaCol.demINSSAcoCol"
    Expression ="TbAcolhidaCol.demSCFVAcoCol"
    Expression ="TbAcolhidaCol.demEducAcoCol"
    Expression ="TbAcolhidaCol.demSaudeAcoCol"
    Expression ="TbAcolhidaCol.demJustiçaAcoCol"
    Expression ="TbAcolhidaCol.demBenefMunAcoCol"
    Expression ="TbAcolhidaCol.demAuxNatalAcoCol"
    Expression ="TbAcolhidaCol.demGratTranspAcoCol"
    Expression ="TbAcolhidaCol.demRecJusAcoCol"
    Expression ="TbAcolhidaCol.demDocCivilAcoCol"
    Expression ="TbAcolhidaCol.demApoioAlimAcoCol"
    Expression ="TbAcolhidaCol.[outra DemAcoCol]"
    Expression ="TbAcolhidaCol.especOutraAcoCol"
    Expression ="TbAcolhidaCol.encRedeSAAcoCol"
    Expression ="TbAcolhidaCol.encSaudeAcoCol"
    Expression ="TbAcolhidaCol.encEducAcoCol"
    Expression ="TbAcolhidaCol.encSemfazAcoCol"
    Expression ="TbAcolhidaCol.encENGAcoCol"
    Expression ="TbAcolhidaCol.encOPAcoCol"
    Expression ="TbAcolhidaCol.encComiteSR"
End
Begin Joins
    LeftTable ="TbNomeAcolhida"
    RightTable ="TbAcolhidaCol"
    Expression ="TbNomeAcolhida.IdNome = TbAcolhidaCol.NomeAcoCol"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAcolhidaCol"
    Expression ="TbCadFuncionario.CodFunc = TbAcolhidaCol.NomeServidor"
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
Begin
    Begin
        dbText "Name" ="TbAcolhidaCol.DataAcoCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.CodAcolhidaCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbNomeAcolhida.Nome"
        dbInteger "ColumnWidth" ="1830"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encComiteSR"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1620"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demGratTranspAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1020"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demAuxNatalAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1410"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.DNascAcoCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.cpfAcoCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encOPAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="975"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.rgAcoCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="1935"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.celAcoCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encSemfazAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="780"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demBPCAcoCol"
        dbInteger "ColumnWidth" ="1815"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encENGAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1275"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demINSSAcoCol"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demSCFVAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1755"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demEducAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1995"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demSaudeAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1650"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demJustiçaAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demBenefMunAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demRecJusAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1095"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demDocCivilAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.demApoioAlimAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1170"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.[outra DemAcoCol]"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1365"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.especOutraAcoCol"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encRedeSAAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1530"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encSaudeAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1155"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.encEducAcoCol"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="975"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="ESPECIALIDADE"
        dbInteger "ColumnWidth" ="945"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.NomeServidor"
        dbInteger "ColumnWidth" ="2415"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbNomeAcolhida.NomeAcoCol"
        dbInteger "ColumnWidth" ="3060"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcolhidaCol.NomeAcoCol"
        dbInteger "ColumnWidth" ="3060"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.NomeServidor"
        dbInteger "ColumnWidth" ="2415"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-432
    Top =54
    Right =962
    Bottom =674
    Left =-1
    Top =-1
    Right =1370
    Bottom =391
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =400
        Bottom =327
        Top =0
        Name ="TbAcolhidaCol"
        Name =""
    End
    Begin
        Left =448
        Top =12
        Right =592
        Bottom =156
        Top =0
        Name ="TbNomeAcolhida"
        Name =""
    End
    Begin
        Left =640
        Top =12
        Right =978
        Bottom =362
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
End
