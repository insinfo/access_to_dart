# Gate integrado: 54 tabelas e todas as colunas escalares

A análise `analysis-integrated-803634a/analysis.json` foi refeita dos originais,
com overlay `.src` atual. Confirma 54 tabelas e as nove coleções com PK e
sinalização autonumérica físicas. O controle CodResid mantém `Enabled=NotDefault`
e o backend gerado contém a alocação transacional reconhecida no doc40.

O scaffold `generated-integrated-803634a` passou no analyze backend/frontend,
compilou backend AOT e produziu release web com **435 arquivos verificados**.
Essa geração corresponde ao código 803634a; as funcionalidades posteriores de
combo multicoluna e consultas têm suas validações separadas nos docs41/43/44.
Compilar não comprova todos os fluxos.

## Prova ampliada no mesmo banco

`tools/verify_sigasul_migration.dart` agora recebe um sétimo argumento opcional:
`dao-all-scalar-oracle.json`. O quinto continua comparando as 188 colunas
anteriores e os cinco anexos; o sexto compara os 55 valores multivalorados; o
sétimo exige contrato `typed-column-pk-v2`, mesmo hash de fonte e cobertura de
todas as tabelas/colunas físicas escalares pelo auditor. As comparações usam o
mesmo banco PostgreSQL temporário. Divergências abortam antes do handoff de
navegador, e o banco é removido em finally.

A referência DAO v2 contém 45 tabelas, 887 colunas, 123.862 registros e
4.694.077 células. O leitor Dart coincidiu integralmente com essa referência
(doc39), incluindo as quatro PKs Double. Essa prova do leitor não substitui a
comparação PostgreSQL.

## Primeira execução rejeitada: perda de componente temporal

A migração estrita com dpgsql aplicou 54 tabelas, 123.922 registros lógicos,
41 FKs e 98 índices. As contagens coincidiram e as 188 colunas/cinco anexos
anteriores passaram. O arquivo de quarentena foi comparado com a fonte física:
um registro órfão preservado exatamente, hash da fonte inalterado.

O novo gate encontrou **885/887 colunas correspondentes**, recusando:

- `TbAtColetivo.horario`;
- `TbGrupo.Horario`.

Ambas são DateTime físico do Access migrado para `time without time zone`.
Os NULLs coincidem, mas a representação não contém a data; o auditor registra
`temporalComponentsMissing=true` e não a completa por suposição. A máscara de
exibição não autoriza remover componentes do valor armazenado.

A execução falhou antes do HTTP/navegador integrado e o banco foi removido.
Não é um gate integral aprovado. Artefatos rejeitados preservados privadamente
em `migration-integrated-803634a-rejected-time-loss/`; log
`build/codex-migration-integrated-rejected-time-loss.log`. A prova independente
da quarentena está no mesmo diretório. Dados e hashes individuais de campos
não são versionados.

Próxima etapa: separar semântica de armazenamento da apresentação, testar
DateTime com data/hora/micros, defaults e transporte civil sem deslocamento de
fuso, e repetir o gate completo. Não enfraquecer o oráculo para aceitar TIME.


## Nova execução integrada aprovada

Após a correção temporal do commit `21c986c`, o scaffold foi gerado novamente
com `analysis-integrated-query/analysis.json`, que acrescenta o contrato DAO de
CSPRONT1 à mesma análise física. O executável do gate também foi compilado AOT
nesse commit: alterações posteriores dos agentes não mudaram a execução em curso.
O backend foi compilado AOT, ambos os analyze passaram e o release frontend
verificou **471 arquivos**. São 45 cadastros principais, sem CRUD das nove
coleções internas; elas permanecem nas 54 tabelas migradas. O diretório `api`
do backend não é um cadastro adicional.

O resultado em `migration-integrated-final/` passou:

- 54/54 contagens DAO, 123.922 registros lógicos, 41 FKs e 98 índices;
- **887/887 colunas escalares das 45 tabelas**, sem divergências; os dois
  horários anteriormente rejeitados agora conservam a data em TIMESTAMP;
- as 188 colunas anteriores e os cinco payloads de anexos, em verificação
  independente mantida pelo quinto argumento;
- três coleções multivaloradas, 55 valores lógicos com associação ao pai;
- um registro órfão preservado exatamente no arquivo de quarentena, com a
  fonte Access inalterada;
- HTTP real retornando as 7.040 pessoas esperadas.

No mesmo banco validado, o auditor de anexos confirmou cinco arquivos,
25 metadados e associação aos pais (doc50). Os três campos de metadados que
são NULL em todos esses arquivos continuam sem prova de valores não nulos.
Não se somam esses metadados ao denominador das 887 colunas físicas escalares.

O backend completo serviu o release e a API na mesma origem. A consulta
CSPRONT1 foi conferida novamente por HTTP, agora com o armazenamento temporal
corrigido: **sete casos, cinco com linhas, 134 colunas**, nomes/tipos/ordinais e
hashes de todas as células coincidentes com DAO. O auditor independente
`audit_http_cspront1.dart` não inicia servidor nem altera o banco.

O navegador verificou 2.869 residências, 16 linhas relacionadas em dois
subformulários, cinco respostas de API e zero erros/gravações. O probe também
comparou três inputs nativos de data com o registro da API selecionado pela
chave, incluindo DataCad com máscara Access; dois tinham valor e um era NULL.
Isso verifica a apresentação das datas reais após a mudança para ISO completo.
Não comprova edição de todos os campos nem equivalência dos 97 formulários.

O gate terminou com exit0; o banco temporário foi removido e o servidor/túnel
foram encerrados. Artefatos privados: `row-count-audit.json`,
`postgres-value-audit.json`, `postgres-all-scalar-audit.json`,
`postgres-complex-audit.json`, `quarantine-integrity-audit.json`,
`backend-http-audit.json` e `backend-browser-audit.json` no diretório da migração.
A paridade HTTP da consulta está em `query-audit/cspront1-http-integrated.json`;
os metadados dos anexos em `value-audit/pg-attachment-metadata.json`.

A correção posterior de edição de PK Double (doc46) tem seus próprios testes
POST/PUT/concorrência; não é apresentada como parte deste snapshot 21c986c.
Escrita multivalorada, subforms editáveis, demais eventos VBA, consultas e
renderização dos relatórios continuam abertos na meta principal.
