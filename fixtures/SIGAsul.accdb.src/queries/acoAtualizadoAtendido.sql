SELECT
  TbAtend.Data,
  TbAtend.Nome,
  csACOultimaAtualização.[MáxDeDATA ATUALIZ],
  TbAtend.Volante
FROM
  csACOultimaAtualização
  INNER JOIN TbAtend ON csACOultimaAtualização.CodPessoa = TbAtend.Nome;
