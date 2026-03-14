SELECT
  csAcompPorTecnico.CodTecnico,
  csAcompPorTecnico.NomeTec,
  csAcompPorTecnico.[Carga Horária],
  Count(csAcompPorTecnico.Nome) AS ContarDeNome,
  Count(csAcompPorTecnico.[PAF inicio]) AS [ContarDePAF inicio],
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE
FROM
  csAcompPorTecnico,
  TbUnidade
GROUP BY
  csAcompPorTecnico.CodTecnico,
  csAcompPorTecnico.NomeTec,
  csAcompPorTecnico.[Carga Horária],
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  csAcompPorTecnico.CodTecnico
HAVING
  (
    (
      (csAcompPorTecnico.CodTecnico)<> False
      And (csAcompPorTecnico.CodTecnico)<> False
    )
  );
