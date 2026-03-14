Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPessDemanEspec"
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
    Alias ="SomaDePESAUT"
    Expression ="Sum(UnionPessDemanEspec.PESAUT)"
    Alias ="SomaDePESCEG"
    Expression ="Sum(UnionPessDemanEspec.PESCEG)"
    Alias ="SomaDePESBVISAO"
    Expression ="Sum(UnionPessDemanEspec.PESBVISAO)"
    Alias ="SomaDePESSURSEV"
    Expression ="Sum(UnionPessDemanEspec.PESSURSEV)"
    Alias ="SomaDePESSSURLEV"
    Expression ="Sum(UnionPessDemanEspec.PESSSURLEV)"
    Alias ="SomaDePESDEFIS"
    Expression ="Sum(UnionPessDemanEspec.PESDEFIS)"
    Alias ="SomaDePESDEFMENT"
    Expression ="Sum(UnionPessDemanEspec.PESDEFMENT)"
    Alias ="SomaDePESDOWN"
    Expression ="Sum(UnionPessDemanEspec.PESDOWN)"
    Alias ="SomaDePESTMENT"
    Expression ="Sum(UnionPessDemanEspec.PESTMENT)"
    Alias ="SomaDePESDCRON"
    Expression ="Sum(UnionPessDemanEspec.PESDCRON)"
    Alias ="SomaDePESGEST"
    Expression ="Sum(UnionPessDemanEspec.PESGEST)"
    Alias ="SomaDePESIDO"
    Expression ="Sum(UnionPessDemanEspec.PESIDO)"
    Alias ="SomaDeAUTPBF"
    Expression ="Sum(UnionPessDemanEspec.AUTPBF)"
    Alias ="SomaDeCEGPBF"
    Expression ="Sum(UnionPessDemanEspec.CEGPBF)"
    Alias ="SomaDeBVPBF"
    Expression ="Sum(UnionPessDemanEspec.BVPBF)"
    Alias ="SomaDeSSEVPBF"
    Expression ="Sum(UnionPessDemanEspec.SSEVPBF)"
    Alias ="SomaDeSLEVPBF"
    Expression ="Sum(UnionPessDemanEspec.SLEVPBF)"
    Alias ="SomaDeDEFPBF"
    Expression ="Sum(UnionPessDemanEspec.DEFPBF)"
    Alias ="SomaDeDMENTPBF"
    Expression ="Sum(UnionPessDemanEspec.DMENTPBF)"
    Alias ="SomaDeSDPBF"
    Expression ="Sum(UnionPessDemanEspec.SDPBF)"
    Alias ="SomaDeTMENTPBF"
    Expression ="Sum(UnionPessDemanEspec.TMENTPBF)"
    Alias ="SomaDeDCRONPBF"
    Expression ="Sum(UnionPessDemanEspec.DCRONPBF)"
    Alias ="SomaDeGESTPBF"
    Expression ="Sum(UnionPessDemanEspec.GESTPBF)"
    Alias ="SomaDeIDOPBF"
    Expression ="Sum(UnionPessDemanEspec.IDOPBF)"
    Alias ="SomaDeAUTPBZ"
    Expression ="Sum(UnionPessDemanEspec.AUTPBZ)"
    Alias ="SomaDeCEGPBZ"
    Expression ="Sum(UnionPessDemanEspec.CEGPBZ)"
    Alias ="SomaDeBVPBZ"
    Expression ="Sum(UnionPessDemanEspec.BVPBZ)"
    Alias ="SomaDeSSEVPBZ"
    Expression ="Sum(UnionPessDemanEspec.SSEVPBZ)"
    Alias ="SomaDeSLEVPBZ"
    Expression ="Sum(UnionPessDemanEspec.SLEVPBZ)"
    Alias ="SomaDeDEFPBZ"
    Expression ="Sum(UnionPessDemanEspec.DEFPBZ)"
    Alias ="SomaDeDMENTPBZ"
    Expression ="Sum(UnionPessDemanEspec.DMENTPBZ)"
    Alias ="SomaDeSDPBZ"
    Expression ="Sum(UnionPessDemanEspec.SDPBZ)"
    Alias ="SomaDeTMENTPBZ"
    Expression ="Sum(UnionPessDemanEspec.TMENTPBZ)"
    Alias ="SomaDeDCRONPBZ"
    Expression ="Sum(UnionPessDemanEspec.DCRONPBZ)"
    Alias ="SomaDeGESTPBZ"
    Expression ="Sum(UnionPessDemanEspec.GESTPBZ)"
    Alias ="SomaDeIDOPBZ"
    Expression ="Sum(UnionPessDemanEspec.IDOPBZ)"
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
        dbText "Name" ="SomaDePESIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESGEST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESDEFMENT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESBVISAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESDCRON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESDEFIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESCEG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESTMENT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESSSURLEV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESAUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESDOWN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESSURSEV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDMENTPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSLEVPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTMENTPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEFPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCEGPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCRONPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeGESTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDMENTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBVPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeGESTPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSDPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSSEVPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIDOPBF"
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
    Left =44
    Top =93
    Right =831
    Bottom =660
    Left =-1
    Top =-1
    Right =763
    Bottom =255
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =92
        Top =24
        Right =434
        Bottom =265
        Top =0
        Name ="UnionPessDemanEspec"
        Name =""
    End
    Begin
        Left =479
        Top =51
        Right =623
        Bottom =219
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
