SELECT
  TbReuniao.CodReuniao,
  TbReuniaoDet.CodReuniao,
  TbReuniao.Data,
  TbReuniao.Assunto,
  TbReuniao.Interna,
  TbReuniao.Externa,
  TbReuniao.Local,
  TbReuniao.Intersetorial,
  TbReuniao.Qual,
  TbReuniao.Ata,
  TbReuniaoDet.Nome
FROM
  TbReuniao
  INNER JOIN TbReuniaoDet ON TbReuniao.CodReuniao = TbReuniaoDet.CodReuniao
WHERE
  (
    (
      (TbReuniao.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
