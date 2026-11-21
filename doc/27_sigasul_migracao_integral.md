# SIGAsul: migração integral e contagem independente — 21/11/2026

A validação usa `SIGAsul.accdb` e o backend SUL, sem misturar a base CENTRAL.
O backend SUL tem SHA-256
`49da020eb4f0aa40118cff541a0365a03b9d6a7f05c84f68268ed16531a7c1f3`.
As bases PostgreSQL de teste são novas, criadas com `TEMPLATE template0` e
removidas em `finally`; os arquivos Access são somente leitura.

## Gargalo corrigido

A geração de INSERT inferia a semântica temporal examinando todas as linhas
novamente para cada célula DateTime. Em uma coluna com N datas à meia-noite,
isso fazia N varreduras de N linhas. A tentativa completa revelou o gargalo
antes de terminar `seed.sql`; o processo próprio foi interrompido e sua base
temporária removida, sem classificar essa execução como aprovada.

O gerador agora calcula a semântica uma vez por coluna e lote, tanto para
INSERT quanto COPY. O resultado não é armazenado globalmente: um lote seguinte
com horários reais é reavaliado. A API de serialização isolada mantém a inferência
quando não recebe a semântica já calculada.

`migration_temporal_batch_test.dart` limita o número de observações das linhas,
em vez de depender de cronômetro, e verifica mudança de date-only para timestamp
entre lotes. Junto a `access_temporal_semantics_test.dart`, três testes passaram;
a análise estática dos arquivos não apontou problemas.

## Migração estrita

A migração completa aplicou **123.866 registros em 50 tabelas** usando
`--not-null-mode strict --unique-mode strict --auto-number-mode sequence`.
São 45 tabelas originais e cinco tabelas auxiliares de anexos. Não foi necessário
relaxar essas restrições para passar esta validação. O executor reportou 37
foreign keys e 80 índices criados; esses totais incluem estruturas geradas e
não são apresentados como equivalência de nomes de todos os índices Access.

A primeira auditoria comparou PostgreSQL com `TableDef.RecordCount` e encontrou
cinco divergências. Em vez de ajustar o decoder ou aceitar as diferenças sem
prova, foi consultado o DAO independente:

| Tabela | Contador antigo no catálogo | COUNT(*) DAO / PostgreSQL |
|---|---:|---:|
| CadResidencia | 2.867 | 2.869 |
| TbRecepção | 2.706 | 2.767 |
| CadResidAtualizacao | 9.151 | 9.173 |
| TbAtColetivoDet | 2.423 | 2.495 |
| TbPessoa | 7.031 | 7.040 |

Nas cinco, `Recordset` snapshot com `MoveLast().RecordCount` também confirmou
`COUNT(*)`. Portanto, os contadores antigos de TableDef estavam desatualizados;
não foi alterado o leitor de linhas para fazer os números coincidirem.

O DAO conferiu todas as 45 tabelas originais: **123.862 registros**. Os cinco
campos de anexos foram percorridos por `Field.Value`/`Recordset2`, com contagens
0, 1, 1, 1 e 1. Total independente: **123.866**, igual ao PostgreSQL em **50/50**
tabelas. O hash do Access foi igual antes e depois da auditoria.

## Backend completo contra a base migrada

O backend gerado das 50 tabelas foi compilado em executável e iniciado apenas
em `127.0.0.1`, contra uma nova base temporária criada pela mesma migração
estrita. A auditoria automática conferiu novamente **50/50 contagens DAO**,
com zero divergências. Um GET real em `/api/v1/tb_pessoa` retornou HTTP 200 e
**7.040 pessoas**, igual ao DAO, sem executar gravações. O processo servidor e
a base temporária foram encerrados/removidos em `finally`. Isso prova essa
leitura de ponta a ponta, não todos os endpoints nem todos os fluxos do sistema.

Log: `build/codex-sigasul-dao-http-migration.log`. Relatórios sem dados pessoais:
`migration-dao-http-audit/row-count-audit.json` e `backend-http-audit.json`,
relativos a `build/codex-sigasul-goal/`.

## Reprodução e limites

- `tools/audit_dao_row_counts.ps1` produz o oráculo independente; senha Access
  vem de `ACCESS_DAO_PASSWORD`, não de arquivo versionado.
- `tools/verify_sigasul_migration.dart` recebe análise, diretório de saída,
  oráculo opcional e executável backend opcional. Credenciais PG e senha Access
  vêm de variáveis de sessão. Valida hash e conjunto completo de tabelas antes
  de usar as contagens DAO como referência.
- Sem oráculo, o resultado é identificado como comparação de contagens do
  catálogo; não se faz passar esse contador por um COUNT independente.
- Com executável backend, a ferramenta também testa uma requisição HTTP somente
  leitura para a lista de pessoas e compara sua contagem com o DAO.

Artefatos locais em `build/codex-sigasul-goal/migration-strict-audit/`: SQL,
manifesto de migração, contagens PostgreSQL e `dao-complete-count-oracle.json`.
Eles contêm ou se referem a dados de desenvolvimento e ficam fora do Git.

**Limite da prova:** igualdade de contagens não compara todos os valores,
conteúdo binário dos anexos, regras de negócio, telas ou relatórios. A migração
bem-sucedida não encerra a meta de converter integralmente o sistema.
