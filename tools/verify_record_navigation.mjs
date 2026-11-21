// Synthetic HTTP data only; never connects to the SIGAsul database.
const {chromium}=await import(process.env.PLAYWRIGHT_MODULE ?? 'playwright-core');
import http from 'node:http';
import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
const root=path.resolve(process.argv[2]);
const server=http.createServer(async(req,res)=>{
 try {
  const pathname=new URL(req.url,'http://localhost').pathname;
  const file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));
  if(!file.startsWith(root+path.sep)){res.writeHead(403).end();return;}
  res.setHeader('Content-Type',file.endsWith('.js')?'text/javascript':file.endsWith('.css')?'text/css':file.endsWith('.html')?'text/html':'application/octet-stream');
  res.end(await fs.readFile(file));
 }catch{res.writeHead(404).end();}
});
await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true,channel:'chrome'});
try{
 const page=await browser.newPage(); const errors=[],writes=[],gets=[],dialogs=[]; let acceptConfirmation=false;
 page.on('dialog',async dialog=>{dialogs.push({type:dialog.type(),message:dialog.message()});if(dialog.type()==='confirm'&&!acceptConfirmation)await dialog.dismiss();else await dialog.accept();});
 page.on('pageerror',e=>errors.push(String(e)));
 let rows=[{id_nome:10,nome:'Synthetic A'},{id_nome:20,nome:'Synthetic B'},{id_nome:30,nome:'Synthetic C'}];
 await page.route('**/api/**',async route=>{
  const request=route.request();
  assert.equal(new URL(request.url()).pathname,'/api/v1/tb_nome_acolhida','must call actual backend snake_case route');
  if(request.method()!=='GET')writes.push(request.method());else gets.push(request.url());
  await route.fulfill({contentType:'application/json',body:JSON.stringify(rows)});
 });
 await page.goto(`http://127.0.0.1:${server.address().port}`);
 await page.getByRole('button',{name:'Editar',exact:true}).first().click();
 const editor=page.locator('incluir-tb-nome-acolhida-page');
 const input=editor.locator('input').first();
 async function value(expected){await page.waitForFunction(([selector,v])=>document.querySelector(selector)?.value===v,['incluir-tb-nome-acolhida-page input',expected]);assert.equal(await input.inputValue(),expected);}
 await value('Synthetic A');
 assert.deepEqual(dialogs,[],'initialization must not open dialogs');
 await editor.getByRole('button',{name:'Anterior',exact:true}).click();await value('Synthetic A');
 assert.equal(dialogs.length,1);assert.equal(dialogs[0].type,'alert');
 await editor.getByRole('button',{name:'Último',exact:true}).click();await value('Synthetic B');
 assert.equal(dialogs.length,1,'successful GoToRecord must not show stale MacroError');
 await editor.getByRole('button',{name:'Probe Previous',exact:true}).click();await value('Synthetic A');
 await editor.getByRole('button',{name:'Probe Next',exact:true}).click();await value('Synthetic B');
 // Actual exported caption Próximo maps to token 3, Last. Do not infer from label.
 await editor.getByRole('button',{name:'Próximo',exact:true}).click();await value('Synthetic C');
 await editor.getByRole('button',{name:'Probe Next',exact:true}).click();await value('');
 await editor.getByRole('button',{name:'Probe Previous',exact:true}).click();await value('Synthetic C');
 await editor.getByRole('button',{name:'Primeiro',exact:true}).click();await value('Synthetic A');
 await editor.getByRole('button',{name:'Probe Previous',exact:true}).click();await value('Synthetic A');
 assert.match(await editor.innerText(),/Não há registro disponível/);
 await input.fill('Unsaved synthetic edit');
 await editor.getByRole('button',{name:'Próximo',exact:true}).click();await value('Unsaved synthetic edit');
 assert.match(await editor.innerText(),/Salve ou descarte explicitamente/);
 await editor.getByRole('button',{name:'Descartar alterações e navegar',exact:true}).click();
 await value('Unsaved synthetic edit');
 assert.equal(dialogs.at(-1)?.type,'confirm');
 assert.equal(dialogs.length,2);
 await input.fill('Synthetic A');
 await editor.getByRole('button',{name:'Probe Previous',exact:true}).click();await value('Synthetic A');
 assert.match(await editor.innerText(),/Não há registro disponível/,'Cancel must retain the first record, not just input text');
 await input.fill('Unsaved synthetic edit');
 await editor.getByRole('button',{name:'Probe Next',exact:true}).click();
 acceptConfirmation=true;
 await editor.getByRole('button',{name:'Descartar alterações e navegar',exact:true}).click();
 await value('Synthetic B');
 assert.equal(dialogs.length,3);
 await editor.getByRole('button',{name:'Novo',exact:true}).click();await value('');
 await editor.getByRole('button',{name:'Salvar',exact:true}).click();
 await page.waitForFunction(()=>document.querySelector('.invalid-feedback')?.textContent?.trim().length>0);
 assert.equal(dialogs.at(-1)?.type,'alert');
 assert.ok(dialogs.at(-1)?.message.length>0);
 assert.equal(dialogs.length,4,'one macro failure, two explicit confirmations and one save validation alert');
 assert.equal(await editor.getByRole('button',{name:'Novo',exact:true}).isDisabled(),false,'exact real error sequence is supported');
 // API contract guard: a nonordered snapshot must never choose an arbitrary row.
 rows=[{id_nome:30,nome:'Synthetic C'},{id_nome:10,nome:'Synthetic A'}];
 await page.reload();await page.getByRole('button',{name:'Editar',exact:true}).first().click();
 await editor.getByRole('button',{name:'Primeiro',exact:true}).click();await value('Synthetic C');
 assert.match(await editor.innerText(),/sem chave numérica única e ordenada/);
 assert.ok(gets.every(url=>!url.includes('limit=')&&!url.includes('offset=')));
 assert.deepEqual(writes,[]);assert.deepEqual(errors,[]);
 console.log(JSON.stringify({status:'passed',actualMacros:['First','Last','Previous with conditional error','Next without stale error','New without write'],syntheticProbes:['Next','Previous','New'],unsavedGuard:true,boundaries:true,orderedSnapshotGuard:true,discardCancelPreserved:true,discardAcceptNavigated:true,validationAlert:true,dialogs:dialogs.map(d=>d.type),writes,errors},null,2));
}finally{await browser.close();await new Promise(resolve=>server.close(resolve));}
