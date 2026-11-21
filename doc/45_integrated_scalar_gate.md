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
