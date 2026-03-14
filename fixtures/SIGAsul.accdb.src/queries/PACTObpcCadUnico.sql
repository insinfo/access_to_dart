SELECT
  BPC.CODBPC,
  BPC.CRAS,
  BPC.Cadunico,
  BPC.[Numero Beneficio],
  BPC.NomeTitular,
  BPC.[Data Nasc],
  BPC.Endereco,
  BPC.Bairro,
  BPC.CEP,
  BPC.Mae,
  BPC.Situacao,
  BPC.[Especie Ben],
  BPC.Municipio,
  BPC.UF,
  BPC.NIS
FROM
  BPC
WHERE
  (
    (
      (BPC.CRAS) Like [DIGITE O CRAS] + "*"
    )
    AND (
      (BPC.Cadunico)= "sim"
    )
  );
