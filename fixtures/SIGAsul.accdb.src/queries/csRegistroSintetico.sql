SELECT
  TbAcomp.CodAcomp,
  TbAcomp.DataIncl,
  TbAcompDet.[PAF inicio],
  - DateDiff(
    "m",
    Date(),
    [TbAcompDet].[PAF inicio]
  ) AS nummes,
  TbPessoa.Nome,
  TbPessoa.CodFam,
  TbRegSint.CodRegSint,
  TbRegSint.CodAcomp,
  TbRegSint.DataRegSint,
  TbRegSint.NomeTecnico,
  TbRegSint.[Foram efetivamente disponibilizadas],
  TbRegSint.[Em relação aos encaminhamentos],
  TbRegSint.[A familia reconhece o Serviço de Aco],
  TbRegSint.[Houve agravamento],
  TbRegSint.[A situação atual é equivalente à sit inicial],
  TbRegSint.[Houve avanço mas não justifica desligamento],
  TbRegSint.[Houve significativo avanço e justifica desligamento],
  TbRegSint.[Acompanhamento PAIF sem sucesso não aderiu ao PAF]
FROM
  (
    TbPessoa
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
    ) ON TbPessoa.CodPessoa = TbAcomp.Nome
  )
  INNER JOIN TbRegSint ON TbAcomp.CodAcomp = TbRegSint.CodAcomp
WHERE
  (
    (
      (TbAcomp.CodAcomp)= [Formulários]![FrmAco]![CodAcomp]
    )
  );
