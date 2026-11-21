# Release frontend: corrida do daemon e pacote verificado

## Falha reproduzida

No Windows, o caminho `dart run webdev build` podia terminar com exit 0 depois de compilar JavaScript válido, mas deixar o diretório de distribuição sem index/JS ou com esses arquivos truncados a zero bytes. O `.build.manifest` permanecia. Um teste antigo aceitava o JS do cache `.dart_tool/build/generated` como alternativa ao pacote final, ocultando a falha.

A ocorrência foi reproduzida independentemente no recorte OpenForm de quatro módulos e no recorte mestre/detalhe de três módulos. No segundo, o cache compilado tinha JS de 835.079 bytes, enquanto `build/index.html` e `build/main.dart.js` tinham zero bytes. Não houve limpeza global pelos agentes, nem modificação de bancos de dados para provocar a falha.

## Evidência temporal e diagnóstico

Um probe frio copiou o mesmo scaffold de quatro módulos sem `.dart_tool`/build e observou os entrypoints a cada 200 ms. O processo supervisor permaneceu vivo por mais nove segundos após webdev terminar, descartando a hipótese de mera escrita tardia ou encerramento imediato da sessão SSH.

| Momento relativo | index.html | main.dart.js | Manifest |
|---|---:|---:|---:|
| t=87,390 s, webdev ainda executando | 530 B | 827.131 B | 13.678 B |
| t=88,187 s, ainda executando | ausente | ausente | 13.678 B |
| t=88,390 s, exit 0 | ausente | ausente | 13.678 B |
| nove segundos depois | ausente | ausente | 13.678 B |

Para identificar quem limpava os arquivos, foi criada uma cópia **privada e descartável** de build_runner_core 8.0.0, usada apenas por dependency_override de outro probe. Três pontos receberam logging: `BuildImpl.run`, `_createMergedOutputDir` e `_cleanUpOutputDir`. O PubCache original não foi alterado.

Trace observado no horário local do Windows:

```text
16:04:13.818 RUN []
16:05:18.073 MERGE build
16:05:19.981 RUN [pubspec.yaml, pubspec.lock, quatro access_commands.json, web/index.html]
16:05:20.822 MERGE build
16:05:20.824 CLEANUP build
```

O segundo RUN ocorreu após o primeiro merge. A limpeza lê o manifest e remove os outputs anteriores. A timeline desse probe novamente mostrou entrypoints completos, depois ausentes, e exit 0. Portanto, houve um segundo rebuild automático destrutivo durante o encerramento do caminho webdev, não uma falha de compilação inicial.

A inspeção das versões instaladas corrobora o mecanismo:

- webdev 3.7.1 encerra o cliente após receber o primeiro resultado terminal do target.
- build_daemon 4.0.4 agenda builds por alterações observadas; `_removeChannel` chama `stop()` quando o último cliente sai.
- build_runner 2.4.15 usa esse daemon/watcher no caminho webdev.
- build_runner_core 8.0.0 remove os outputs do manifest ao iniciar outro merge.

Não foi determinado por que o watcher notificou aqueles inputs no cold-build sem edições intencionais durante a compilação. A evidência estabelece o segundo run/cleanup e a perda dos outputs antes do exit; não se atribui a causa a build.yaml, antivírus ou permissões sem prova. Nenhum pacote instalado foi editado como solução.

## Comparação controlada e correção na origem

Outro clone frio, com o mesmo source e sem cache de build, executou:

```text
dart run build_runner build --release --output=web:build
```

Esse processo one-shot manteve index de 530 B, JS de 827.131 B e manifest de 13.678 B antes do exit 0, no exit e nove segundos depois. Ele não mantém watcher/cliente de daemon para agendar um segundo rebuild.

O gerador agora produz `frontend/tool/build_release.dart` e instruções em `frontend/README.md`. O script:

1. usa `Platform.resolvedExecutable` e argumentos estruturados para executar o build_runner one-shot;
2. aguarda a saída do processo e propaga falhas;
3. exige manifest não vazio contendo index.html e main.dart.js;
4. verifica que todos os arquivos listados existem e que HTML/JS essenciais não estão vazios;
5. devolve exit não zero se o pacote estiver incompleto.

Não há retry de webdev, cópia do cache, espera arbitrária para esconder a corrida ou edição permanente de artefatos gerados. `webdev serve` permanece disponível para desenvolvimento; o caminho de distribuição recomendado passa a ser:

```text
dart run tool/build_release.dart
```

O modo `--verify-only` verifica um pacote existente, sem recompilar. Um manifest vazio não valida arquivos antigos, mesmo que index e JS existam.

## Gates corrigidos

O helper comum `test/generation/support/generation_test_utils.dart` e os gates de bindings, projeção SIGAsul e subforms agora invocam o script gerado. A verificação de distribuição não aceita mais cache `.dart_tool` nem caminhos alternativos como substituto dos entrypoints finais.

`test/frontend_release_script_test.dart` gera um scaffold real e executa seu helper com `--verify-only`. Casos cobertos: manifest ausente; manifest sem arquivos; asset adicional faltante; pacote completo; manifest vazio com entrypoints antigos; JS truncado. Falhas retornam exit 1; somente o pacote completo passa.

## Validação real

- Probe frio webdev sem instrumentação: falha reproduzida.
- Probe frio webdev com pacote privado instrumentado: segundo run/cleanup confirmado; falha reproduzida.
- Probe frio one-shot, mesmos quatro módulos: outputs completos e estáveis.
- Gate real de três módulos (CadResidencia/TbPessoa/CadResidAtualizacao), diretório novo `build/codex-subform-release`: core/backend/frontend analyze e release gerado passaram em aproximadamente 1m22.
- Pacote de três módulos: 297/297 entradas do manifest presentes, entrypoints não vazios.
- O guard adicional de manifest vazio/entrypoints foi exercitado pelo teste rápido; o gate real foi então regenerado e repetido com o helper final, passando em aproximadamente 17 s com cache. A primeira compilação fria e o pacote final foram verificados separadamente.
- O pacote **integral do probe frio one-shot** de quatro módulos também foi executado no Chrome: navegação OpenForm parcial funcionou; nenhum editor abriu automaticamente, rota desconhecida foi ignorada, zero page errors e zero requisições de escrita. A API desse teste browser era uma resposta local vazia; não comprova persistência/autorização do backend.

Os logs/timelines dos probes ficaram sob `build/packaging_cold_probe`, `build/packaging_trace_probe` e `build/packaging_direct_probe`. A instrumentação privada não é dependência do produto. A correção utiliza as dependências e SDK existentes, sem upgrade nem patch do PubCache.
