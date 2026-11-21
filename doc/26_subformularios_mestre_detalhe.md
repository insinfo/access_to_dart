# Subformulários mestre/detalhe: consulta vinculada real

## Origem e perda corrigida

O `.accdb.src` SIGAsul contém 14 controles Subform em 11 formulários. O reader
mantinha tipo/nome, mas descartava `SourceObject`, `LinkMasterFields` e
`LinkChildFields`. A sobreposição da análise também tinha whitelist que
eliminava essas propriedades. Os três campos agora atravessam reader, modelo,
overlay e gerador.

Exemplo confirmado no export `FrmCadGeral.bas`:

| Controle | Origem | Campo mestre salvo | Campo filho |
| --- | --- | --- | --- |
| COMPOSIÇÃO FAMILIAR SUBFORM | Form.COMPOSIÇÃO FAMILIAR SUBFORM / TbPessoa | CodFam | CodFam |
| CadResidAtualizacao subformulário | Form.CadResidAtualizacao subformulário / CadResidAtualizacao | CodFam | CodCadResd |

## Comportamento implementado

O editor do registro pai mostra painéis somente para consulta. O endpoint
`GET /api/v1/cad_residencia/<id>/subforms/subform_0`, por exemplo, recebe a
identidade do pai salvo e uma chave de descritor gerado; busca o registro pai
no banco e usa seus valores para filtrar os filhos. O cliente não fornece nomes
de tabelas/colunas nem valores arbitrários de relacionamento.

Todos os campos de um vínculo composto são combinados por AND. Um campo mestre
NULL retorna lista vazia. Pai inexistente, descritor desconhecido e ID inválido
são rejeitados; nenhum caso remove o filtro para retornar a tabela completa.
Campos mestre que referenciam um controle só são aceitos quando esse controle
possui ControlSource resolvido para uma coluna real.

O painel usa a identidade da entidade recebida do servidor, não a chave editável
do rascunho. Registros novos sem identidade não fazem requisição. Respostas de
requisições antigas são descartadas quando o pai muda. A consulta retorna no
máximo 100 linhas, com aviso explícito se houver mais. Os valores são renderizados
como texto pelo Angular, sem montar HTML a partir dos dados.

## Cobertura observada e limites

Após gerar todas as 45 tabelas públicas mais 5 auxiliares, aparecem 13 painéis:
10 com vínculos resolvidos e 3 com indisponibilidade explícita. O décimo quarto
controle pertence a `FrmDadosEspeciaisSCFV`, cuja tabela pai está ausente do
backend fornecido. Auditoria sem dados pessoais em
`build/codex-subform-audit-summary.json`.

Os dez vínculos disponíveis são os dois de FrmCadGeral e os controles:
`TbAcoRetorno subformulário1`, `TbRegSint subformulário`, `ATCOLETIVO SUBFORM`,
`BENEF MUNIC SUBFORM`, `TbBuscaAtivaDet subformulário1`, `TbGestDet
subformulário1`, `TbOfSocioEduAtualiz subformulário` e `TbReuniaoDet
subformulário1`.

São recusados `TbAcompDet subformulário`, `DIARIO SUBFORM` e
`TbSCFVExtAtualiz subformulário`, pois suas fontes/filtros/ordenações ainda não
são suportados integralmente. Também são recusados vínculos incompletos,
colunas não resolvidas, chave primária composta do pai e consultas complexas.
As chaves dos vínculos podem ser compostas; a identidade primária do pai precisa
ser simples nesta etapa.

Ainda faltam criação/edição/exclusão dos filhos, preenchimento automático do
vínculo na inclusão, eventos VBA, paginação além das 100 linhas e fontes com
semântica SQL adicional. Portanto, esta etapa implementa leitura mestre/detalhe
real, não a reprodução integral dos subformulários Access.

## Validação

- Teste rápido lê o export real e verifica os 14 controles e os vínculos da família.
- Geração controlada testa vínculo composto e recusa de vínculo ausente, campo
  inexistente, SQL filtrado e Filter do formulário.
- PostgreSQL temporário criado com TEMPLATE template0 testa pais distintos,
  duas colunas de vínculo, NULL, pai inexistente, descritor desconhecido, ID
  inválido e limite de resultados. Inclui chamada HTTP pelo router/DI gerados.
- Teste de compilação usa a análise real e export atual, gera CadResidencia,
  TbPessoa e CadResidAtualizacao, verifica seus descritores e compila os pacotes.

A validação também revelou o warning preexistente de campo de anexos não usado
em serviços sem anexos. O template agora emite esse campo somente quando há
anexos, permitindo analyzer completo sem suprimir warnings.

O payload contém somente colunas associadas a controles vinculados do filho;
campos binários/complexos não entram nessa grade. Datas são convertidas para ISO
antes da resposta JSON. Propriedades de origem desconhecidas e formulários sem
campos vinculados são explicitamente indisponíveis.

Resultado corrente: 13 testes rápidos e o teste PostgreSQL/HTTP/DI passaram.
Analyzer dos três pacotes do recorte real passou. O gate de publicação dos
assets permanece **reprovado**: `webdev build` retornou 0, porém produziu arquivo
`.dart.js` de zero bytes. O teste novo verifica tamanho do artefato e detecta
essa falha; ela não é tratada como compilação validada. Evidências persistidas
em `build/codex-subform-real/frontend` e
`build/codex-sigasul-subform-build.log`, com investigação de packaging em curso.

Revisão de resolução: nomes de formulário/tabela são comparados primeiro de
forma exata, ignorando somente maiúsculas/minúsculas. A comparação normalizada
só é usada quando há exatamente um candidato; colisões são recusadas. Uma
tabela exata com projeção incompatível não é substituída por outra de nome
normalizado parecido. Testes cobrem colisões de formulários/tabelas, preferência
pelo nome exato e incompatibilidade de projeção.

O painel informa explicitamente: “Consulta vinculada aos dados salvos do registro
principal. Alterações não salvas ainda não são consideradas.”
