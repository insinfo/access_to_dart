Operation =1
Option =0
Where ="(((csRetornoAcomp.TbAcoRetorno.CodAcomp)=[Formulários]![FrmAco]![CodAcomp]))"
Begin InputTables
    Name ="csRetornoAcomp"
    Name ="csCarteiraPAIF"
End
Begin OutputColumns
    Expression ="csRetornoAcomp.TbAcoRetorno.CodAcomp"
    Expression ="csCarteiraPAIF.CodFam"
    Expression ="csCarteiraPAIF.[Nº UNIDADE]"
    Expression ="csCarteiraPAIF.TbUnidade.Nome"
    Expression ="csCarteiraPAIF.ENDEREÇO"
    Expression ="csCarteiraPAIF.MUNICIPIO"
    Expression ="csCarteiraPAIF.UF"
    Expression ="csCarteiraPAIF.TELEFONEUNID"
    Expression ="csCarteiraPAIF.CodPessoa"
    Expression ="csCarteiraPAIF.TbPessoa.Nome"
    Expression ="csCarteiraPAIF.NIS"
    Expression ="csCarteiraPAIF.Parentesco"
    Expression ="csCarteiraPAIF.CODBARRAS"
    Expression ="csCarteiraPAIF.CodCREAS"
    Expression ="csCarteiraPAIF.CodCEAM"
    Expression ="csRetornoAcomp.CodAcoRetorno"
    Expression ="csRetornoAcomp.DataRetorno"
    Expression ="csRetornoAcomp.Historico"
    Expression ="csRetornoAcomp.Obs"
    Expression ="csRetornoAcomp.Compareceu"
    Expression ="csRetornoAcomp.TbAcomp.CodAcomp"
    Expression ="csRetornoAcomp.DataIncl"
    Expression ="csRetornoAcomp.Nome"
    Expression ="csRetornoAcomp.CodFamilia"
    Expression ="csRetornoAcomp.CodAcompDet"
    Expression ="csRetornoAcomp.TbAcompDet.CodAcomp"
    Expression ="csRetornoAcomp.CodTecnico"
    Expression ="csRetornoAcomp.NomeTec"
    Expression ="csRetornoAcomp.[PAF inicio]"
    Expression ="csRetornoAcomp.[PAF fim]"
End
Begin Joins
    LeftTable ="csCarteiraPAIF"
    RightTable ="csRetornoAcomp"
    Expression ="csCarteiraPAIF.CodPessoa = csRetornoAcomp.Nome"
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
        dbText "Name" ="csRetornoAcomp.TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.CodCEAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.CodCREAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.TbAcoRetorno.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.CodAcoRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.Historico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.CodFamilia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.CodAcompDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.TbAcompDet.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRetornoAcomp.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.TELEFONEUNID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCarteiraPAIF.CODBARRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1192
    Bottom =660
    Left =-1
    Top =-1
    Right =1168
    Bottom =365
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =341
        Top =14
        Right =604
        Bottom =324
        Top =0
        Name ="csRetornoAcomp"
        Name =""
    End
    Begin
        Left =70
        Top =70
        Right =296
        Bottom =341
        Top =0
        Name ="csCarteiraPAIF"
        Name =""
    End
End
