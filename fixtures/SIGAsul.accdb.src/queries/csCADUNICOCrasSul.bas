Operation =1
Option =0
Where ="(((CADUNICO.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="CADUNICO"
End
Begin OutputColumns
    Expression ="CADUNICO.Identificação"
    Expression ="CADUNICO.CRAS"
    Expression ="CADUNICO.CODFAM"
    Expression ="CADUNICO.DATACAD"
    Expression ="CADUNICO.DATAATUAL"
    Expression ="CADUNICO.DATAENTREV"
    Expression ="CADUNICO.[CRAS REGIÃO]"
    Expression ="CADUNICO.LOGRADOURO"
    Expression ="CADUNICO.TITULOLOGRAD"
    Expression ="CADUNICO.NUMEND"
    Expression ="CADUNICO.COMPLEM"
    Expression ="CADUNICO.COMPLEM1"
    Expression ="CADUNICO.CEP"
    Expression ="CADUNICO.REFERENCIA"
    Expression ="CADUNICO.DDD1"
    Expression ="CADUNICO.TEL1"
    Expression ="CADUNICO.TEL2"
    Expression ="CADUNICO.DDD2"
    Alias ="NOME"
    Expression ="CADUNICO.NOMECADUNICO"
    Expression ="CADUNICO.NIS"
    Expression ="CADUNICO.DNASC"
    Expression ="CADUNICO.MAE"
    Expression ="CADUNICO.PAI"
    Expression ="CADUNICO.UFNASC"
    Expression ="CADUNICO.CIDADENASC"
    Expression ="CADUNICO.LIVRO"
    Expression ="CADUNICO.FOLHA"
    Expression ="CADUNICO.TERMO"
    Expression ="CADUNICO.MUNIC_CERT"
    Expression ="CADUNICO.CPF"
    Expression ="CADUNICO.RG"
    Expression ="CADUNICO.DATAEMISRG"
    Expression ="CADUNICO.UFRG"
    Expression ="CADUNICO.ORGEMISSOR"
    Expression ="CADUNICO.CTPS"
    Expression ="CADUNICO.[SERIE CTPS]"
    Expression ="CADUNICO.DATAEMISSAOCTPS"
    Expression ="CADUNICO.UFCTPS"
    Expression ="CADUNICO.TITULO"
    Expression ="CADUNICO.ZONA"
    Expression ="CADUNICO.SEÇAO"
    Expression ="CADUNICO.DEFICIENCIA"
    Expression ="CADUNICO.ESCOLARIDADE"
    Expression ="CADUNICO.ESCOLA"
    Expression ="CADUNICO.UFESCOLA"
    Expression ="CADUNICO.MUNICESCOLA"
    Expression ="CADUNICO.[RENDA MED]"
    Expression ="CADUNICO.REFCAD"
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
        dbText "Name" ="CADUNICO.DDD1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DDD2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ZONA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TITULO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.PAI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.FOLHA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TEL2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TERMO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TEL1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.COMPLEM1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAENTREV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAEMISRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ORGEMISSOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MAE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.REFCAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATACAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAATUAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.LOGRADOURO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TITULOLOGRAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NUMEND"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.COMPLEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CIDADENASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.LIVRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MUNIC_CERT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[SERIE CTPS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAEMISSAOCTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFCTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SEÇAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DEFICIENCIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ESCOLARIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MUNICESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[CRAS REGIÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.REFERENCIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[RENDA MED]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2340"
        dbBoolean "ColumnHidden" ="0"
    End
End
Begin
    State =0
    Left =22
    Top =78
    Right =1082
    Bottom =651
    Left =-1
    Top =-1
    Right =1036
    Bottom =294
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =193
        Top =5
        Right =337
        Bottom =295
        Top =0
        Name ="CADUNICO"
        Name =""
    End
End
