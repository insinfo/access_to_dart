#!/usr/bin/env python3
"""Read-only UTF-16/RIP-relative-LEA candidates; not a complete disassembler.
Use function bounds from PE .pdata. Inspect emitted candidates in Ghidra/objdump.
No binary or output is uploaded by this script.
"""
from pathlib import Path
import struct,json,bisect,sys
if len(sys.argv) != 2:
 raise SystemExit('Usage: python3 scan_access_catalog.py MSACCESS.EXE')
p=Path(sys.argv[1]); b=p.read_bytes(); u16=lambda o:struct.unpack_from('<H',b,o)[0];u32=lambda o:struct.unpack_from('<I',b,o)[0]
pe=u32(0x3c)
if b[:2] != b'MZ' or b[pe:pe+4] != b'PE\0\0' or u16(pe+4) != 0x8664 or u16(pe+24) != 0x20b:
 raise SystemExit('Expected x86-64 PE32+ binary')
n=u16(pe+6);opt=pe+24; base=struct.unpack_from('<Q',b,opt+24)[0]; off=opt+u16(pe+20)
sec=[]
for i in range(n):
 o=off+40*i;name=b[o:o+8].rstrip(b'\0').decode();sz,va,rawsz,raw=struct.unpack_from('<IIII',b,o+8);sec.append((name,va,sz,raw,rawsz))
def rva(o):
 for name,v,s,r,rs in sec:
  if r<=o<r+rs:return v+o-r
 raise ValueError(o)
pdata=next(s for s in sec if s[0]=='.pdata');fs=[]
for o in range(pdata[3],pdata[3]+pdata[4]-11,12):
 start,end,unwind=struct.unpack_from('<III',b,o)
 if start and end>start:fs.append((start,end))
fs.sort();starts=[x[0] for x in fs]
def fun(a):
 i=bisect.bisect_right(starts,a)-1
 return fs[i] if i>=0 and fs[i][0]<=a<fs[i][1] else None
targets={}
for word in ['Forms','Reports','Modules','Scripts','Tables','Databases']:
 pattern=(word+'\0').encode('utf-16le');pos=0
 while (pos:=b.find(pattern,pos))>=0:
  targets[rva(pos)]=(word,pos);pos+=len(pattern)
text=next(s for s in sec if s[0]=='.text');results=[]
for prefix in [b'\x48\x8d',b'\x4c\x8d']:
 pos=text[3]
 while (pos:=b.find(prefix,pos,text[3]+text[4]))>=0:
  if b[pos+2]&0xc7==5:
   a=rva(pos); dest=a+7+struct.unpack_from('<i',b,pos+3)[0]
   if dest in targets:
    f=fun(a);results.append({'string':targets[dest][0],'string_rva':hex(dest),'string_file_offset':hex(targets[dest][1]),'xref_rva':hex(a),'function_rva':None if f is None else [hex(x) for x in f]})
  pos+=2
print(json.dumps({'sha256':__import__('hashlib').sha256(b).hexdigest(),'image_base':hex(base),'targets':results},indent=2))
