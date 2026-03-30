# Relatorio Reverso de Formularios Access

- arquivo: `C:\MyDartProjects\access_to_dart\scratch/reverse_forms/option_group_with_label.accdb`
- gerado em: `2026-03-29T20:20:51.993829`
- formularios analisados: `1`
- formularios mapeados em `MSysAccessStorage`: `1`

## Formulario `frmOptionGroupProbe`

- `RecordSource`: `OptionGroupProbe`
- controles: `5`
- secoes: `1`
- `Blob`: `3581` bytes
- `TypeInfo`: `214` bytes
- `PropData`: `22` bytes

### Secoes

- `detail` / `Detalhe` -> `lblEstadoGrupoProbe`, `grpEstadoIsolado`, `optEstadoAberto`, `optEstadoAnalise`, `optEstadoFechado`

### Controles

- `lblEstadoGrupoProbe` tipo `Label`
  source: `Estado da solicitacao`
  layout: `left=720, top=420, width=2100, height=300, section=Detalhe`
  match blob: `2070`
  blob record: `1796..1813` propertyId=256, typeCode=1
  blob record: `1815..1835` propertyId=267, typeCode=4, int16=0, int32=-219021312, utf16=
  blob record: `1837..1857` propertyId=268, typeCode=4, int16=0, int32=65536
  blob record: `1859..1879` propertyId=270, typeCode=6, int16=0, int32=0
  blob geometry: `282..285` preferred left=720 top=420 width=2100 height=300 source=canonical
  layout x blob: `allMatch=true`
- `grpEstadoIsolado` tipo `OptionGroup`
  source: `EstadoOpcao`
  layout: `section=Detalhe`
  match blob: `2458`
  blob record: `2168..2200` propertyId=234, typeCode=9, int16=0, int32=-751632384, utf16=팳穓냗䚑�杁碳
  blob record: `2202..2222` propertyId=282, typeCode=3, int16=0, int32=47185920, utf16=ː
  blob record: `2224..2244` propertyId=283, typeCode=3, int16=0, int32=27525120, utf16=Ƥ
  blob record: `2246..2266` propertyId=284, typeCode=3, int16=0, int32=184811520, utf16=଄
  blob geometry: `282..285` fallback left=720 top=420 width=2100 height=300 source=reverse-tool
- `optEstadoAberto` tipo `OptionButton`
  layout: `left=1020, top=1260, width=2100, height=240, section=Detalhe`
  match blob: `2801`
  blob record: `2440..2490` propertyId=220, typeCode=10, int16=0, int32=6750208, utf16=grpEstadoIsolado
  blob record: `2490..2530` propertyId=221, typeCode=12, int16=0, int32=4521984, utf16=EstadoOpcao
  blob record: `2530..2562` propertyId=244, typeCode=9, int16=0, int32=-355074048, utf16=ʅ伉膣ꠂĆ
  blob record: `2586..2606` propertyId=291, typeCode=3, int16=0, int32=243793920, utf16=ຈ
  blob geometry: `293..296` fallback left=1020 top=1260 width=2100 height=240 source=canonical
  layout x blob: `allMatch=true`
- `optEstadoAnalise` tipo `OptionButton`
  layout: `left=1020, top=1560, width=2100, height=240, section=Detalhe`
  match blob: `3100`
  blob record: `2761..2781` propertyId=156, typeCode=4, int16=0, int32=65536
  blob record: `2783..2831` propertyId=220, typeCode=10, int16=0, int32=7274496, utf16=optEstadoAberto
  blob record: `2831..2863` propertyId=244, typeCode=9, int16=0, int32=1877999616, utf16=濰ꒇ䠻փ櫈衍
  blob record: `2887..2907` propertyId=293, typeCode=3, int16=0, int32=66846720, utf16=ϼ
  blob geometry: `293..296` fallback left=1020 top=1560 width=2100 height=240 source=canonical
  layout x blob: `allMatch=true`
- `optEstadoFechado` tipo `OptionButton`
  layout: `left=1020, top=1860, width=2100, height=240, section=Detalhe`
  match blob: `3401`
  blob record: `3060..3080` propertyId=156, typeCode=4, int16=0, int32=131072
  blob record: `3082..3132` propertyId=220, typeCode=10, int16=0, int32=7274496, utf16=optEstadoAnalise
  blob record: `3132..3164` propertyId=244, typeCode=9, int16=0, int32=1151926272, utf16=䒩潦갩䤮妑嵇
  blob record: `3188..3208` propertyId=293, typeCode=3, int16=0, int32=66846720, utf16=ϼ
  blob geometry: `293..296` fallback left=1020 top=1860 width=2100 height=240 source=canonical
  layout x blob: `allMatch=true`