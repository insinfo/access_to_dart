SELECT
  DISTINCT csCADUNICOCrasSul.CODFAM,
  csCADUNICOCrasSul.NOME
FROM
  csCADUNICOCrasSul
WHERE
  (
    (
      (csCADUNICOCrasSul.NOME) Is Not Null
    )
    AND (
      (csCADUNICOCrasSul.[RENDA MED])<= 606
    )
  );
