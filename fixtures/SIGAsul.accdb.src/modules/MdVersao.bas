Attribute VB_Name = "MdVersao"
Option Compare Database

Public Function fVersao() As Variant
fVersao = DLookup("nomeSistema", "TbVersao") & " - Versão: " & DLookup("Versao", "TbVersao") & " - Desenvolvedora: " & DLookup("Desenvolvedora", "TbVersao") & " - Data da Última Atualização: " & DLookup("DataultimaAtualizacao", "TbVersao")
End Function
