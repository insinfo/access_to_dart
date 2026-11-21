"""Static IDA probe for one verified MSACCESS build; never executes the target.
Usage: python ida_report_probe.py COPY_OF_MSACCESS.EXE OUTPUT.json
Use a private binary copy: IDA may create its database beside that input.
Requires a previously configured IDA profile; does not accept license terms.
Auto-analysis disabled; only the bounded section-name routine is disassembled.
"""
import idapro
import ida_auto, ida_bytes, ida_funcs, ida_ua, ida_nalt, idautils, ida_lines
import json,sys,hashlib,struct
import ida_kernwin
binary,output=sys.argv[1:3]
if hashlib.sha256(open(binary,'rb').read()).hexdigest()!='2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f':
 raise SystemExit('Different binary: derive new function ranges before proceeding')
print('version',idapro.get_library_version(),flush=True)
r=idapro.open_database(binary,False)
print('open',r,flush=True)
if r: raise SystemExit(r)
try:
 ida_auto.enable_auto(False)
 base=ida_nalt.get_imagebase(); result={'library_version':idapro.get_library_version(),'kernel_version':ida_kernwin.get_kernel_version(),'sha256':hashlib.sha256(open(binary,'rb').read()).hexdigest(),'image_base':hex(base),'auto_analysis':False,'functions':[]}
 for lo,hi in [(0x32bbc0,0x32bf4c)]:
  ea=base+lo;end=base+hi;lines=[]
  while ea<end:
   size=ida_ua.create_insn(ea)
   if not size: break
   lines.append({'rva':hex(ea-base),'asm':ida_lines.tag_remove(ida_lines.generate_disasm_line(ea,0) or '')})
   ea+=size
  ida_funcs.add_func(base+lo,end)
  result['functions'].append({'rva':hex(lo),'end':hex(hi),'instructions':lines})
 result['xrefs']={}
 for rva in [0xc2d1d8,0xc2d218,0xc5b490,0xc654a0,0xc5b1a8,0xc5b1d0,0xc5b1e8]:
  result['xrefs'][hex(rva)]=[{'from':hex(x.frm-base),'type':x.type} for x in idautils.XrefsTo(base+rva)]
 # Read-only pointer candidates from PE sections, independent of IDA auto-analysis.
 b=open(binary,'rb').read();pe=struct.unpack_from('<I',b,0x3c)[0]
 n=struct.unpack_from('<H',b,pe+6)[0];opt=pe+24
 so=opt+struct.unpack_from('<H',b,pe+20)[0];sections=[]
 for i in range(n):
  off=so+40*i;vs,va,rs,raw=struct.unpack_from('<IIII',b,off+8)
  sections.append((va,raw,rs))
 def rva(file_offset):
  for va,raw,rs in sections:
   if raw<=file_offset<raw+rs:return va+file_offset-raw
  return None
 result['string_pointer_candidates']=[]
 for word in ['BreakLevel','GroupHeader','GroupFooter','SortOrder','GroupOn','GroupInterval','KeepTogether']:
  needle=(word+'\0').encode('utf-16le');pos=0
  while (pos:=b.find(needle,pos))>=0:
   srva=rva(pos);locations=[]
   if srva is not None:
    target=struct.pack('<Q',base+srva);ptr=0
    while (ptr:=b.find(target,ptr))>=0:
     prva=rva(ptr)
     if prva is not None:
      locations.append({'file_offset':hex(ptr),'rva':hex(prva),'ida_qword':hex(ida_bytes.get_qword(base+prva))})
     ptr+=8
    result['string_pointer_candidates'].append({'text':word,'file_offset':hex(pos),'rva':hex(srva),'pointers':locations})
   pos+=len(needle)
 open(output,'w').write(json.dumps(result,indent=2))
finally:
 idapro.close_database(False)
print('done',flush=True)

assert hashlib.sha256(open(binary,"rb").read()).hexdigest()==result["sha256"]
