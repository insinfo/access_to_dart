Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPessDemEspBenef"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.FUNÇÃO"
    Alias ="SomaDeAUTBPC"
    Expression ="Sum(UnionPessDemEspBenef.AUTBPC)"
    Alias ="SomaDeCEGBPC"
    Expression ="Sum(UnionPessDemEspBenef.CEGBPC)"
    Alias ="SomaDeBVBPC"
    Expression ="Sum(UnionPessDemEspBenef.BVBPC)"
    Alias ="SomaDeSSEVBPC"
    Expression ="Sum(UnionPessDemEspBenef.SSEVBPC)"
    Alias ="SomaDeSLEVBPC"
    Expression ="Sum(UnionPessDemEspBenef.SLEVBPC)"
    Alias ="SomaDeDEFBPC"
    Expression ="Sum(UnionPessDemEspBenef.DEFBPC)"
    Alias ="SomaDeDMENTBPC"
    Expression ="Sum(UnionPessDemEspBenef.DMENTBPC)"
    Alias ="SomaDeSDBPC"
    Expression ="Sum(UnionPessDemEspBenef.SDBPC)"
    Alias ="SomaDeTMENTBPC"
    Expression ="Sum(UnionPessDemEspBenef.TMENTBPC)"
    Alias ="SomaDeDCRONBPC"
    Expression ="Sum(UnionPessDemEspBenef.DCRONBPC)"
    Alias ="SomaDeIDOBPC"
    Expression ="Sum(UnionPessDemEspBenef.IDOBPC)"
    Alias ="SomaDeAUTBMD"
    Expression ="Sum(UnionPessDemEspBenef.AUTBMD)"
    Alias ="SomaDeCEGBMD"
    Expression ="Sum(UnionPessDemEspBenef.CEGBMD)"
    Alias ="SomaDeBVBMD"
    Expression ="Sum(UnionPessDemEspBenef.BVBMD)"
    Alias ="SomaDeSSEVBMD"
    Expression ="Sum(UnionPessDemEspBenef.SSEVBMD)"
    Alias ="SomaDeSLEVBMD"
    Expression ="Sum(UnionPessDemEspBenef.SLEVBMD)"
    Alias ="SomaDeDEFBMD"
    Expression ="Sum(UnionPessDemEspBenef.DEFBMD)"
    Alias ="SomaDeDMENTBMD"
    Expression ="Sum(UnionPessDemEspBenef.DMENTBMD)"
    Alias ="SomaDeSDBMD"
    Expression ="Sum(UnionPessDemEspBenef.SDBMD)"
    Alias ="SomaDeTMENTBMD"
    Expression ="Sum(UnionPessDemEspBenef.TMENTBMD)"
    Alias ="SomaDeDCRONBMD"
    Expression ="Sum(UnionPessDemEspBenef.DCRONBMD)"
    Alias ="SomaDeIDOBMD"
    Expression ="Sum(UnionPessDemEspBenef.IDOBMD)"
    Alias ="SomaDeAUTBMI"
    Expression ="Sum(UnionPessDemEspBenef.AUTBMI)"
    Alias ="SomaDeCEGBMI"
    Expression ="Sum(UnionPessDemEspBenef.CEGBMI)"
    Alias ="SomaDeBVBMI"
    Expression ="Sum(UnionPessDemEspBenef.BVBMI)"
    Alias ="SomaDeSSEVBMI"
    Expression ="Sum(UnionPessDemEspBenef.SSEVBMI)"
    Alias ="SomaDeSLEVBMI"
    Expression ="Sum(UnionPessDemEspBenef.SLEVBMI)"
    Alias ="SomaDeDEFBMI"
    Expression ="Sum(UnionPessDemEspBenef.DEFBMI)"
    Alias ="SomaDeDMENTBMI"
    Expression ="Sum(UnionPessDemEspBenef.DMENTBMI)"
    Alias ="SomaDeSDBMI"
    Expression ="Sum(UnionPessDemEspBenef.SDBMI)"
    Alias ="SomaDeTMENTBMI"
    Expression ="Sum(UnionPessDemEspBenef.TMENTBMI)"
    Alias ="SomaDeDCRONBMI"
    Expression ="Sum(UnionPessDemEspBenef.DCRONBMI)"
    Alias ="SomaDeIDOBMI"
    Expression ="Sum(UnionPessDemEspBenef.IDOBMI)"
    Alias ="SomaDeAUTBSF"
    Expression ="Sum(UnionPessDemEspBenef.AUTBSF)"
    Alias ="SomaDeCEGBSF"
    Expression ="Sum(UnionPessDemEspBenef.CEGBSF)"
    Alias ="SomaDeBVBSF"
    Expression ="Sum(UnionPessDemEspBenef.BVBSF)"
    Alias ="SomaDeSSEVBSF"
    Expression ="Sum(UnionPessDemEspBenef.SSEVBSF)"
    Alias ="SomaDeSLEVBSF"
    Expression ="Sum(UnionPessDemEspBenef.SLEVBSF)"
    Alias ="SomaDeDEFBSF"
    Expression ="Sum(UnionPessDemEspBenef.DEFBSF)"
    Alias ="SomaDeDMENTBSF"
    Expression ="Sum(UnionPessDemEspBenef.DMENTBSF)"
    Alias ="SomaDeSDBSF"
    Expression ="Sum(UnionPessDemEspBenef.SDBSF)"
    Alias ="SomaDeTMENTBSF"
    Expression ="Sum(UnionPessDemEspBenef.TMENTBSF)"
    Alias ="SomaDeDCRONBSF"
    Expression ="Sum(UnionPessDemEspBenef.DCRONBSF)"
    Alias ="SomaDeIDOBSF"
    Expression ="Sum(UnionPessDemEspBenef.IDOBSF)"
End
Begin Groups
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
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
        dbText "Name" ="SomaDeDMENTBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDMENTBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDMENTBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDMENTBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-6
    Top =79
    Right =991
    Bottom =527
    Left =-1
    Top =-1
    Right =973
    Bottom =268
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =366
        Top =-1
        Right =510
        Bottom =272
        Top =0
        Name ="UnionPessDemEspBenef"
        Name =""
    End
    Begin
        Left =87
        Top =7
        Right =231
        Bottom =199
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
