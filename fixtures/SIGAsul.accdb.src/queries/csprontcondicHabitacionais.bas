Operation =1
Option =0
Where ="(((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((TbPes"
    "soa.Parentesco)=\"Pessoa de Referencia\") AND ((CadResidencia.DataDesligResid) I"
    "s Null))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbPessoa.Parentesco"
    Expression ="CadResidencia.DataDesligResid"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[Resid Propria]"
    Expression ="CadResidencia.[Resid Alugada]"
    Expression ="CadResidencia.[Resid Cedida]"
    Expression ="CadResidencia.[Resid Ocupada]"
    Expression ="CadResidencia.[Alvenaria/madeira aparelhada]"
    Expression ="CadResidencia.[Madeira aproveitada/taipa/outros]"
    Expression ="CadResidencia.[Medidor compart]"
    Expression ="CadResidencia.[Sem Medidor]"
    Expression ="CadResidencia.[Sem energia eletrica]"
    Expression ="CadResidencia.[Medidor proprio]"
    Expression ="CadResidencia.[Agua canalizada]"
    Expression ="CadResidencia.[Abast Rede geral]"
    Expression ="CadResidencia.[Poço/Nascente]"
    Expression ="CadResidencia.[Cisterna/Captação]"
    Expression ="CadResidencia.[Carro pipa]"
    Expression ="CadResidencia.[Outra forma abast]"
    Expression ="CadResidencia.[Rede Coletora esgoto]"
    Expression ="CadResidencia.[Fossa septica]"
    Expression ="CadResidencia.[Fossa rudimentar]"
    Expression ="CadResidencia.[Vala Rio Lago]"
    Expression ="CadResidencia.[Sem banheiro]"
    Expression ="CadResidencia.[Coleta lixo direta]"
    Expression ="CadResidencia.[Coleta lixo indireta]"
    Expression ="CadResidencia.[Sem Coleta lixo]"
    Expression ="CadResidencia.[Nº Comodos]"
    Expression ="CadResidencia.[Nº Dormitorios]"
    Expression ="CadResidencia.[Nº pessoas/Dormitorio]"
    Expression ="CadResidencia.[Domicilio tem acessib total]"
    Expression ="CadResidencia.[Domicilio tem acessib interno]"
    Expression ="CadResidencia.[Domicilio sem acessib]"
    Expression ="CadResidencia.[Area de risco]"
    Expression ="CadResidencia.[Area dif acesso geografico]"
    Expression ="CadResidencia.[Area violencia]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.[CodFam] = TbPessoa.[CodFam]"
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
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Comodos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Dormitorios]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº pessoas/Dormitorio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area dif acesso geografico]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem Coleta lixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Ocupada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Agua canalizada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Madeira aproveitada/taipa/outros]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Coleta lixo direta]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Medidor compart]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio sem acessib]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio tem acessib total]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Abast Rede geral]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Propria]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Alugada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Cedida]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Alvenaria/madeira aparelhada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem Medidor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem energia eletrica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Medidor proprio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Poço/Nascente]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Cisterna/Captação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Carro pipa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Outra forma abast]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem banheiro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Rede Coletora esgoto]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fossa septica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fossa rudimentar]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Vala Rio Lago]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Coleta lixo indireta]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio tem acessib interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-397
    Top =81
    Right =689
    Bottom =701
    Left =-1
    Top =-1
    Right =1062
    Bottom =129
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =87
        Top =19
        Right =265
        Bottom =256
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =563
        Top =4
        Right =779
        Bottom =258
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
