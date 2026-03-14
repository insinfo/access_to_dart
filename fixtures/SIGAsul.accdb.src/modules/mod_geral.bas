Attribute VB_Name = "mod_geral"
Option Compare Database

Public Sub fncAuditar(strNomeForm As String, bytOperação As Byte, strCampo As String)
'--------------------------------------------------------------------
'Argumento bytOperação : 0 - inclusão | 1 - Alteração | 2 - Exclusão
'--------------------------------------------------------------------
Dim strSql$
strSql = "INSERT INTO tblAuditoria (NomeUsuario,DataOperação,TipoOperação,MaquinaOrigem,NomeFormulario,identificação) "
strSql = strSql & "VALUES(""" & CreateObject("Wscript.network").UserName & """,'" & Now & "','" & bytOperação
strSql = strSql & "','" & Environ("computername") & "','" & strNomeForm & "',""" & strCampo & """);"
CurrentDb.Execute strSql
End Sub
