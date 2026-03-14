SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.NomeFunc,
  TbAtend.FuncaoFuncionario,
  TbAtend.Nome,
  TbAtend.VD,
  TbAtend.VDLFR,
  TbAtend.VDCDL,
  TbAtend.VDDCP,
  TbAtend.VDDPAF,
  TbAtend.VDAMF,
  TbAtend.VDFVI,
  TbAtend.VDAMD,
  TbAtend.VDASF,
  TbAtend.VDPBF,
  TbAtend.VDSCFV,
  TbAtend.VDOUT,
  TbAtend.[QUAL VD],
  TbAtend.[VD NAO LOCALIZADA]
FROM
  TbAtend
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
