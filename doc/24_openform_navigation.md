# OpenForm: primeira navegação interna verificável

## Comportamento entregue

Os CommandButtons do formulário selecionado para cada módulo agora aparecem na página de edição gerada. Uma macro OpenForm elegível cria um link interno para o módulo correspondente. O shell valida a rota contra os módulos gerados e troca a página, sem executar expressões Access, sem abrir automaticamente um editor, sem selecionar um primeiro registro e sem gravar dados.

Caso real validado: `FrmAtendimento.Comando703`, caption **Abrir Formulário de Benefícios Eventuais/Outros**, aponta para `FrmBenefEmergencial`, representado pelo módulo `tb-beneficio-emergencial`. O usuário vê uma indicação antes do link e um aviso no destino: os eventos de abertura e a janela do formulário original ainda não foram reproduzidos.

Esse caso tem status **partial_navigation**, nunca `supported`/`fully_supported` no inventário de comandos. O link abre o cadastro gerado; não promete executar OpenForm com toda a semântica do Access. Em particular, não executa OnOpen/OnLoad VBA nem reproduz PopUp. As regras/autorização de eventos originais continuam pendentes e precisam ser traduzidas antes de considerar o fluxo equivalente.

## Critérios e recusas

A macro precisa ter uma única ação OpenForm, sem condição, filhos executáveis ou outras propriedades não reconhecidas. Comentários `_AXL` são mantidos como dados. São aceitos somente seis argumentos explícitos no padrão observado na fixture: `[destino, '0', '', '', '-1', '0']`. Filtros/WhereCondition, sequências, outros modos e outras ações continuam indisponíveis.

O destino precisa corresponder **exatamente ao formulário selecionado pelo gerador** de um único módulo. Ter a mesma tabela que outro formulário não é suficiente. O export deve fornecer o mapa `properties`: ausência/null bloqueia a navegação. `AccessSrcForm.properties` é nullable para não transformar ausência de export em defaults conhecidos; o leitor preenche o mapa quando lê o bloco Form. O overlay mantém os valores sem interpretar arbitrariamente flags.

O gate também recusa Filter ou OrderBy não vazio, DataEntry/Modal ativos e propriedades explícitas de restrição AllowEdits/AllowAdditions/AllowDeletions. A política é conservadora: não tenta converter essas combinações nesta etapa. PopUp não é reproduzido, e o caminho é explicitamente navegação parcial para um módulo, não abertura de janela Access.

Exemplos recusados:

- `FrmAtendimento.Comando673 → FrmEncaminhamento`: existe filtro original no destino; ele não é descartado para abrir todos os registros.
- `FrmBeneficios.Comando674 → Impressões Referentes a Benefícios`: formulário sem módulo CRUD correspondente; não se inventa um destino.
- DataMode 2, condição `[Autorizado]=True`, sequência adicional RunCommand, destino alternativo da mesma tabela e propriedades de abertura desconhecidas.

Os botões recusados ficam desabilitados, com motivo visível. Cada módulo exporta `access_commands.json` com control, label, destination, href, status e notice. Isso registra a diferença entre navegação parcial e ação ainda não disponível.

## Referências dos argumentos

A ordem FormName/View/FilterName/WhereCondition/DataMode/WindowMode está documentada em [DoCmd.OpenForm](https://learn.microsoft.com/en-us/office/vba/api/access.docmd.openform). A definição da [macro OpenForm](https://learn.microsoft.com/en-us/office/client-developer/access/desktop-database-reference/openform-macro-action) explica que a abertura normal depende também das propriedades do formulário. Os valores 0 de Form view e Window normal constam em [AcFormView](https://learn.microsoft.com/en-us/office/vba/api/access.acformview) e [AcWindowMode](https://learn.microsoft.com/en-us/office/vba/api/access.acwindowmode); DataMode -1 é identificado como acFormPropertySettings em [AcFormOpenDataMode](https://learn.microsoft.com/en-us/office/vba/api/access.acformopendatamode). Nenhum desses enums autoriza ignorar os eventos, filtros ou propriedades originais.

## Validação

`test/access_openform_navigation_test.dart` usa os quatro forms reais SIGAsul e um schema controlado mínimo para testar geração. Seis casos passam: navegação parcial positiva, condições/filtros, propriedades ausentes, modo read-only, formulário alternativo da mesma tabela e sequência de ações. O teste também verifica escaping de caption hostil e o whitelist do shell.

A validação adicional gerou quatro módulos com **schema real** do snapshot `build/codex-sigasul-goal/analysis-final/analysis.json` (50 tabelas locais/32 vinculadas), reaplicando o leitor `.src` atual. Recorte: TbAtend, TbBeneficioEmergencial, TbBeneficiosMunicipais e TbEncaminhamento. Samples foram retirados do recorte antes da geração. Não houve nova extração Access nem escrita no banco.

- Core `dart analyze lib`: limpo.
- Frontend `dart analyze lib`: limpo.
- `dart run webdev build`: release compilado, aproximadamente 1m02, JS de 827.131 bytes.
- Chrome/Playwright sobre artefatos compilados: clique no botão real levou ao módulo esperado; aviso parcial visível; nenhum editor abriu automaticamente; rota desconhecida não mudou o módulo; zero page errors e zero requisições de escrita.
- API do teste browser respondeu coleção vazia por interceptação local. Esse teste comprova navegação cliente, não autorização, queries ou persistência do backend.

O runtime foi primeiro testado com index e JS compilados em um harness temporário. Depois foi **repetido sobre o pacote integral** `release_probe` produzido pelo próprio webdev, sem reconstruir arquivos manualmente; também passou. Screenshot e resultados brutos ficam em diretório temporário, sem dados pessoais.

### Ocorrência de empacotamento a investigar

A primeira execução webdev retornou exit 0 e compilou o JS, porém `frontend/build` continha apenas `.build.manifest` quando inspecionado. Não havia index.html/main.dart.js no diretório final. Isso não foi tratado como sucesso de distribuição.

Uma execução incremental com `--output=web:release_probe`, seguida de outra no output default, produziu corretamente **295/295 arquivos** listados no manifest, incluindo index.html e JS. A causa da ocorrência inicial não foi estabelecida; o build.yaml e os pacotes instalados não foram alterados para mascará-la. **TODO: reproduzir cold-build e investigar lifecycle/empacotamento; não aceitar somente exit 0.**

`tools/verify_frontend_output.dart` verifica o manifest e a presença dos dois arquivos essenciais, devolvendo exit não zero quando faltam. O verificador passou no pacote final default. O problema inicial permanece uma limitação de confiabilidade a investigar, não uma correção alegada nesta entrega.

## Reprodução

```text
dart test test/access_openform_navigation_test.dart
dart run tools/generate_openform_validation_slice.dart build/codex-sigasul-goal/analysis-final/analysis.json fixtures/SIGAsul.accdb.src build/access_openform_slice
```

No core e no frontend do recorte, executar pub get e analyze. No frontend, executar `dart run webdev build`. Depois, a partir da raiz do conversor:

```text
dart run tools/verify_frontend_output.dart build/access_openform_slice/app/frontend/build
node tools/verify_openform_navigation.mjs CAMINHO_DO_PACOTE_WEB
```

O script browser requer Chrome e `playwright-core`. Se o módulo não estiver no node_modules local, definir `PLAYWRIGHT_MODULE` com o caminho do seu index.mjs; `CHROME_PATH` permite escolher o executável. O script inicia/encerra servidor HTTP e browser próprios, intercepta somente API para respostas vazias e rejeita artefatos essenciais ausentes. Não modifica o código do app compilado.

## Atualização: release determinístico

A investigação posterior reproduziu e identificou um segundo rebuild/cleanup do daemon após o primeiro merge. O gerador agora emite `tool/build_release.dart` com build_runner one-shot e verificação do pacote; os gates não aceitam mais o cache como distribuição. Ver [diagnóstico e validação cold-build](28_frontend_release_packaging.md). Para releases, substituir o comando webdev build acima por `dart run tool/build_release.dart`; webdev serve continua sendo o caminho de desenvolvimento.
