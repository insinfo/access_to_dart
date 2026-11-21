"""Bounded static probe of Access behavior metadata for the pinned Office build.
Never executes MSACCESS. Uses configured IDA profile without changing licenses.
"""
import hashlib,json,sys
import idapro
import ida_auto,ida_bytes,ida_funcs,ida_ua,ida_nalt,ida_kernwin,ida_lines,idautils
EXPECTED='2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f'
binary,output=sys.argv[1:3]
assert hashlib.sha256(open(binary,'rb').read()).hexdigest()==EXPECTED
rc=idapro.open_database(binary,False)
print('open_database',rc,flush=True)
if rc:raise SystemExit(rc)
try:
 ida_auto.enable_auto(False);base=ida_nalt.get_imagebase()
 def utf16(ptr):
  chars=[]
  for i in range(256):
   if not ida_bytes.is_loaded(ptr+2*i):return None
   c=ida_bytes.get_word(ptr+2*i)
   if c==0:return ''.join(chars)
   if c<32:return None
   chars.append(chr(c))
  return None
 result={'sha256':EXPECTED,'kernel':ida_kernwin.get_kernel_version(),'library_version':idapro.get_library_version(),'base':hex(base),'auto_analysis':False,'metadata_blocks':{},'function':{}}
 for name,lo,hi in [('goto_candidate',0xba1d90,0xba1f00),('openform_candidate',0xba21b0,0xba2400),('openform_action',0xb5a710,0xb5a750),('goto_action',0xb5a560,0xb5a5a0)]:
  entries=[]
  for rva in range(lo,hi,8):
   value=ida_bytes.get_qword(base+rva)
   text=utf16(value) if base<=value<base+0x2000000 else None
   entries.append({'rva':hex(rva),'qword':hex(value),'text':text})
  result['metadata_blocks'][name]=entries
 lo,hi=0x9a7e3c,0x9a8193;ea=base+lo;end=base+hi;lines=[]
 while ea<end:
  size=ida_ua.create_insn(ea)
  if not size:break
  lines.append({'rva':hex(ea-base),'asm':ida_lines.tag_remove(ida_lines.generate_disasm_line(ea,0)or'')})
  ea+=size
 ida_funcs.add_func(base+lo,end)
 result['function']={'rva':hex(lo),'end':hex(hi),'instructions':lines,'xrefs_wherecondition':[{'from':hex(x.frm-base),'type':x.type}for x in idautils.XrefsTo(base+0xbffbb8)]}
 try:
  import ida_hexrays
  if ida_hexrays.init_hexrays_plugin():
   decompiled=ida_hexrays.decompile(base+lo)
   result['function']['pseudocode']=str(decompiled) if decompiled else None
  else:result['function']['decompiler_status']='plugin_unavailable'
 except Exception as error:result['function']['decompiler_status']=str(error)
 open(output,'w').write(json.dumps(result,indent=2,ensure_ascii=False));print('instructions',len(lines),flush=True)
finally:idapro.close_database(False)
assert hashlib.sha256(open(binary,'rb').read()).hexdigest()==EXPECTED
