SELECT
  csRetornoAcomp.TbAcoRetorno.CodAcomp,
  csCarteiraPAIF.CodFam,
  csCarteiraPAIF.[Nº UNIDADE],
  csCarteiraPAIF.TbUnidade.Nome,
  csCarteiraPAIF.ENDEREÇO,
  csCarteiraPAIF.MUNICIPIO,
  csCarteiraPAIF.UF,
  csCarteiraPAIF.TELEFONEUNID,
  csCarteiraPAIF.CodPessoa,
  csCarteiraPAIF.TbPessoa.Nome,
  csCarteiraPAIF.NIS,
  csCarteiraPAIF.Parentesco,
  csCarteiraPAIF.CODBARRAS,
  csCarteiraPAIF.CodCREAS,
  csCarteiraPAIF.CodCEAM,
  csRetornoAcomp.CodAcoRetorno,
  csRetornoAcomp.DataRetorno,
  csRetornoAcomp.Historico,
  csRetornoAcomp.Obs,
  csRetornoAcomp.Compareceu,
  csRetornoAcomp.TbAcomp.CodAcomp,
  csRetornoAcomp.DataIncl,
  csRetornoAcomp.Nome,
  csRetornoAcomp.CodFamilia,
  csRetornoAcomp.CodAcompDet,
  csRetornoAcomp.TbAcompDet.CodAcomp,
  csRetornoAcomp.CodTecnico,
  csRetornoAcomp.NomeTec,
  csRetornoAcomp.[PAF inicio],
  csRetornoAcomp.[PAF fim]
FROM
  csCarteiraPAIF
  INNER JOIN csRetornoAcomp ON csCarteiraPAIF.CodPessoa = csRetornoAcomp.Nome
WHERE
  (
    (
      (
        csRetornoAcomp.TbAcoRetorno.CodAcomp
      )= [Formulários]![FrmAco]![CodAcomp]
    )
  );
