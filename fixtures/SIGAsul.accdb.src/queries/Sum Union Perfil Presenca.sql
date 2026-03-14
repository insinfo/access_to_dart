SELECT
  Sum(
    [Union Perfil Presenca].[0a5inc]
  ) AS SomaDe0a5inc,
  Sum(
    [Union Perfil Presenca].[6a11inc]
  ) AS SomaDe6a11inc,
  Sum(
    [Union Perfil Presenca].[12a14inc]
  ) AS SomaDe12a14inc,
  Sum(
    [Union Perfil Presenca].[15a17inc]
  ) AS SomaDe15a17inc,
  Sum(
    [Union Perfil Presenca].[18a29inc]
  ) AS SomaDe18a29inc,
  Sum(
    [Union Perfil Presenca].[30a59inc]
  ) AS SomaDe30a59inc,
  Sum(
    [Union Perfil Presenca].[60inc]
  ) AS SomaDe60inc,
  Sum(
    [Union Perfil Presenca].[0a5ins]
  ) AS SomaDe0a5ins,
  Sum(
    [Union Perfil Presenca].[6a11ins]
  ) AS SomaDe6a11ins,
  Sum(
    [Union Perfil Presenca].[12a14ins]
  ) AS SomaDe12a14ins,
  Sum(
    [Union Perfil Presenca].[15a17ins]
  ) AS SomaDe15a17ins,
  Sum(
    [Union Perfil Presenca].[18a29ins]
  ) AS SomaDe18a29ins,
  Sum(
    [Union Perfil Presenca].[30a59ins]
  ) AS SomaDe30a59ins,
  Sum(
    [Union Perfil Presenca].[60isc]
  ) AS SomaDe60isc,
  Sum(
    [Union Perfil Presenca].[0a5exc]
  ) AS SomaDe0a5exc,
  Sum(
    [Union Perfil Presenca].[6a11exc]
  ) AS SomaDe6a11exc,
  Sum(
    [Union Perfil Presenca].[12a14exc]
  ) AS SomaDe12a14exc,
  Sum(
    [Union Perfil Presenca].[15a17exc]
  ) AS SomaDe15a17exc,
  Sum(
    [Union Perfil Presenca].[18a29exc]
  ) AS SomaDe18a29exc,
  Sum(
    [Union Perfil Presenca].[30a59exc]
  ) AS SomaDe30a59exc,
  Sum(
    [Union Perfil Presenca].[60exc]
  ) AS SomaDe60exc,
  Sum(
    [Union Perfil Presenca].[0a5pri]
  ) AS SomaDe0a5pri,
  Sum(
    [Union Perfil Presenca].[6a11pri]
  ) AS SomaDe6a11pri,
  Sum(
    [Union Perfil Presenca].[12a14pri]
  ) AS SomaDe12a14pri,
  Sum(
    [Union Perfil Presenca].[15a17pri]
  ) AS SomaDe15a17pri,
  Sum(
    [Union Perfil Presenca].[18a29pri]
  ) AS SomaDe18a29pri,
  Sum(
    [Union Perfil Presenca].[30a59pri]
  ) AS SomaDe30a59pri,
  Sum(
    [Union Perfil Presenca].[60pri]
  ) AS SomaDe60pri,
  Sum(
    [Union Perfil Presenca].[0a5npri]
  ) AS SomaDe0a5npri,
  Sum(
    [Union Perfil Presenca].[6a11npri]
  ) AS SomaDe6a11npri,
  Sum(
    [Union Perfil Presenca].[12a14npri]
  ) AS SomaDe12a14npri,
  Sum(
    [Union Perfil Presenca].[15a17npri]
  ) AS SomaDe15a17npri,
  Sum(
    [Union Perfil Presenca].[18a29npri]
  ) AS SomaDe18a29npri,
  Sum(
    [Union Perfil Presenca].[30a59npri]
  ) AS SomaDe30a59npri,
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(
    [Union Perfil Presenca].[60npri]
  ) AS SomaDe60npri,
  Sum(
    [Union Perfil Presenca].[0a5pres]
  ) AS SomaDe0a5pres,
  Sum(
    [Union Perfil Presenca].[6a11pres]
  ) AS SomaDe6a11pres,
  Sum(
    [Union Perfil Presenca].[12a14pres]
  ) AS SomaDe12a14pres,
  Sum(
    [Union Perfil Presenca].[15a17pres]
  ) AS SomaDe15a17pres,
  Sum(
    [Union Perfil Presenca].[18a29pres]
  ) AS SomaDe18a29pres,
  Sum(
    [Union Perfil Presenca].[30a59pres]
  ) AS SomaDe30a59pres,
  Sum(
    [Union Perfil Presenca].[60pres]
  ) AS SomaDe60pres
FROM
  [Union Perfil Presenca],
  TbUnidade
GROUP BY
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
