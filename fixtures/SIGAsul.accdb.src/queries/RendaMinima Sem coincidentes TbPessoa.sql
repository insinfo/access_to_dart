SELECT
  rendaminimaFam.CRAS,
  rendaminimaFam.NOME,
  rendaminimaFam.nis,
  rendaminimaFam.RENDAPC
FROM
  rendaminimaFam
  LEFT JOIN TbPessoa ON rendaminimaFam.nome = TbPessoa.Nome
WHERE
  (
    (
      (rendaminimaFam.CRAS) Like [DIGITE O CRAS] + "*"
    )
    AND (
      (TbPessoa.Nome) Is Null
    )
  )
ORDER BY
  rendaminimaFam.CRAS,
  rendaminimaFam.NOME;
