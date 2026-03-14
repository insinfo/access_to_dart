SELECT
  TbUnidade.LOGO,
  TbUnidade.CRAS,
  TbUnidade.RODAPE,
  Sum(UnionNumPessoas.NumpessMes) AS SomaDeNumpessMes,
  Sum(UnionNumPessoas.NumPessAteMes) AS SomaDeNumPessAteMes,
  Sum(UnionNumPessoas.NumFamNoMes) AS SomaDeNumFamNoMes,
  Sum(UnionNumPessoas.NumFamAteMes) AS SomaDeNumFamAteMes,
  Sum(UnionNumPessoas.[0a5noMes]) AS SomaDe0a5noMes,
  Sum(UnionNumPessoas.[0a5ateMes]) AS SomaDe0a5ateMes,
  Sum(UnionNumPessoas.[6a11noMes]) AS SomaDe6a11noMes,
  Sum(UnionNumPessoas.[6a11ateMes]) AS SomaDe6a11ateMes,
  Sum(UnionNumPessoas.[12a14noMes]) AS SomaDe12a14noMes,
  Sum(UnionNumPessoas.[12a14ateMes]) AS SomaDe12a14ateMes,
  Sum(UnionNumPessoas.[15a17noMes]) AS SomaDe15a17noMes,
  Sum(UnionNumPessoas.[15a17ateMes]) AS SomaDe15a17ateMes,
  Sum(UnionNumPessoas.[18a29noMes]) AS SomaDe18a29noMes,
  Sum(UnionNumPessoas.[18a29ateMes]) AS SomaDe18a29ateMes,
  Sum(UnionNumPessoas.[30a59noMes]) AS SomaDe30a59noMes,
  Sum(UnionNumPessoas.[30a59ateMes]) AS SomaDe30a59ateMes,
  Sum(UnionNumPessoas.[60noMes]) AS SomaDe60noMes,
  Sum(UnionNumPessoas.[60ateMes]) AS SomaDe60ateMes,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO
FROM
  UnionNumPessoas,
  TbUnidade
GROUP BY
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
