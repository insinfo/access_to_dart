SELECT
  Contatos.*,
  [Sobrenome] & " " & [Nome] & " " & [Empresa] & " " & [EndereçoDeEmail] & " " & [Cargo] & " " & [TelefoneComercial] & " " & [Celular] & " " & [NúmeroDeFax] & " " & [Endereço] & " " & [Cidade] & " " & [EstadoProvíncia] & " " & [CEP] & " " & [PaísRegião] & " " & [CEP] & " " & [PáginaDaWeb] & " " & [Anotações] & " " & [NomeDoContato] & " " & [ArquivoComo] AS Pesquisável
FROM
  Contatos
ORDER BY
  Contatos.NomeDoContato;
