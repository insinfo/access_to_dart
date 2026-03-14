Operation =1
Option =1
Where ="(((TbAtend.VDLFR)=Yes) AND ((TbAtend.Data) Between [DATA INICIAL] And [DATA FINA"
    "L])) OR (((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend."
    "VDCDL)=Yes)) OR (((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND (("
    "TbAtend.VDDCP)=Yes)) OR (((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]"
    ") AND ((TbAtend.VDDPAF)=Yes)) OR (((TbAtend.Data) Between [DATA INICIAL] And [DA"
    "TA FINAL]) AND ((TbAtend.VDAMF)=Yes)) OR (((TbAtend.Data) Between [DATA INICIAL]"
    " And [DATA FINAL]) AND ((TbAtend.VDFVI)=Yes)) OR (((TbAtend.Data) Between [DATA "
    "INICIAL] And [DATA FINAL]) AND ((TbAtend.VDAMD)=Yes)) OR (((TbAtend.Data) Betwee"
    "n [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.VDASF)=Yes)) OR (((TbAtend.Data"
    ") Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.VDPBF)=Yes)) OR (((TbAt"
    "end.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.VDSCFV)=Yes)) O"
    "R (((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.VDOUT)"
    "=Yes))"
Begin InputTables
    Name ="TbAtend"
End
Begin OutputColumns
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
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDOUT"
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
        dbText "Name" ="TbAtend.VDSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FILTRO NÃO ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.QUAL VD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.ESTUDO SOCIAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acolhida Coletiva"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Telefonema"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicossocial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CESTA BASICA NÃO ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.COBERTOR NÃO ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.COLCHONETE NÃO ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.KIT ENXOVAL NÃO ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VD NAO LOCALIZADA"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-167
    Top =45
    Right =1116
    Bottom =490
    Left =-1
    Top =-1
    Right =1259
    Bottom =160
    Left =0
    Top =96
    ColumnsShown =539
    Begin
        Left =62
        Top =0
        Right =338
        Bottom =253
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
