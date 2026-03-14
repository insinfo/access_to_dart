SELECT
  BPC.NomeTitular,
  BPC.CRAS
FROM
  BPC
WHERE
  (
    (
      (BPC.CRAS) Like [DIGITE O CRAS] + "*"
    )
  );
