Operation =1
Option =0
Having ="(((TbAtColetivo.GruposPAIF)=Yes))"
Begin InputTables
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
    Name ="TbCadFuncionario"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.GruposPAIF"
    Alias ="ContarDeDataCol"
    Expression ="Count(TbAtColetivo.DataCol)"
    Expression ="TbAtColetivo.Tema"
    Expression ="TbAtColetivo.OFICINEIRO"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Expression ="TbCadFuncionario.Cargo"
End
Begin Joins
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAtColetivo"
    Expression ="TbCadFuncionario.CodFunc = TbAtColetivo.OFICINEIRO"
    Flag =1
End
Begin Groups
    Expression ="TbAtColetivo.CodColetivo"
    GroupLevel =0
    Expression ="TbAtColetivo.DataCol"
    GroupLevel =0
    Expression ="TbAtColetivo.GruposPAIF"
    GroupLevel =0
    Expression ="TbAtColetivo.Tema"
    GroupLevel =0
    Expression ="TbAtColetivo.OFICINEIRO"
    GroupLevel =0
    Expression ="TbCadFuncionario.Nome"
    GroupLevel =0
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    GroupLevel =0
    Expression ="TbCadFuncionario.Cargo"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAtColetivo.GruposPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDeDataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.OFICINEIRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.Tema"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbInteger "ColumnWidth" ="2040"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Cargo"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-338
    Top =40
    Right =1038
    Bottom =677
    Left =-1
    Top =-1
    Right =1352
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =419
        Bottom =319
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =467
        Top =12
        Right =611
        Bottom =97
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =659
        Top =12
        Right =1018
        Bottom =327
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
End
