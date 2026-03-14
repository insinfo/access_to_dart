SELECT
  CadResidencia.CodFam,
  TbPessoa.Parentesco,
  CadResidencia.DataDesligResid,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  CadResidencia.DataCad,
  CadResidencia.[Resid Propria],
  CadResidencia.[Resid Alugada],
  CadResidencia.[Resid Cedida],
  CadResidencia.[Resid Ocupada],
  CadResidencia.[Alvenaria/madeira aparelhada],
  CadResidencia.[Madeira aproveitada/taipa/outros],
  CadResidencia.[Medidor compart],
  CadResidencia.[Sem Medidor],
  CadResidencia.[Sem energia eletrica],
  CadResidencia.[Medidor proprio],
  CadResidencia.[Agua canalizada],
  CadResidencia.[Abast Rede geral],
  CadResidencia.[Poço/Nascente],
  CadResidencia.[Cisterna/Captação],
  CadResidencia.[Carro pipa],
  CadResidencia.[Outra forma abast],
  CadResidencia.[Rede Coletora esgoto],
  CadResidencia.[Fossa septica],
  CadResidencia.[Fossa rudimentar],
  CadResidencia.[Vala Rio Lago],
  CadResidencia.[Sem banheiro],
  CadResidencia.[Coleta lixo direta],
  CadResidencia.[Coleta lixo indireta],
  CadResidencia.[Sem Coleta lixo],
  CadResidencia.[Nº Comodos],
  CadResidencia.[Nº Dormitorios],
  CadResidencia.[Nº pessoas/Dormitorio],
  CadResidencia.[Domicilio tem acessib total],
  CadResidencia.[Domicilio tem acessib interno],
  CadResidencia.[Domicilio sem acessib],
  CadResidencia.[Area de risco],
  CadResidencia.[Area dif acesso geografico],
  CadResidencia.[Area violencia]
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.[CodFam] = TbPessoa.[CodFam]
WHERE
  (
    (
      (CadResidencia.CodFam)= [Formulários]![FormProntuario]![CodFamTxt]
    )
    AND (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
    )
  );
