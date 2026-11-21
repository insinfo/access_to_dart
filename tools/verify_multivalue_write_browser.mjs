// Explicit writes only against the disposable database owned by the PG harness.
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
const {chromium}=await import(process.env.PLAYWRIGHT_MODULE??'playwright-core');
const [url,resultFile]=process.argv.slice(2);
if(!url||!resultFile)throw new Error('Expected disposable URL and result file');
const browser=await chromium.launch({headless:true,channel:'chrome'});let result;
try {
 const page=await browser.newPage();const writes=[],errors=[];
 page.on('pageerror',e=>errors.push(String(e)));
 page.on('request',r=>{if(!['GET','HEAD','OPTIONS'].includes(r.method()))writes.push({method:r.method(),url:r.url()});});
 await page.goto(url);await page.getByRole('button',{name:'Editar',exact:true}).nth(4).waitFor();
 await page.getByRole('button',{name:'Editar',exact:true}).nth(4).click();
 const panel=page.locator('access-multivalue-panel');
 await panel.getByRole('button',{name:'Atualizar coleção',exact:true}).waitFor();
 await panel.getByText('Carregando coleção...',{exact:true}).waitFor({state:'hidden'});
 assert.equal(await panel.locator('input[type=checkbox]').count(),7);
 const boxes=panel.locator('input[type=checkbox]');
 assert.equal(await panel.locator('input:disabled').count(),0);
 await boxes.nth(0).check();assert.equal(writes.length,0,'selection must not write implicitly');
 page.once('dialog',d=>d.dismiss());await panel.getByRole('button',{name:'Atualizar coleção',exact:true}).click();
 assert.equal(await boxes.nth(0).isChecked(),true);assert.equal(writes.length,0);
 page.once('dialog',d=>d.accept());await panel.getByRole('button',{name:'Descartar seleção',exact:true}).click();
 assert.equal(await boxes.nth(0).isChecked(),false);assert.equal(writes.length,0);
 await boxes.nth(0).check();await boxes.nth(2).check();
 await panel.getByRole('button',{name:'Salvar coleção',exact:true}).click();
 await panel.getByText(/Não foi possível salvar/).waitFor();
 assert.equal(await boxes.nth(0).isChecked(),true);assert.equal(await boxes.nth(2).isChecked(),true);
 assert.equal(await panel.locator('li').count(),0,'failed transaction must not appear saved');
 await boxes.nth(2).uncheck();await panel.getByRole('button',{name:'Salvar coleção',exact:true}).click();
 await panel.getByText('Coleção salva.',{exact:true}).waitFor();
 assert.deepEqual(await panel.locator('li').allTextContents(),['FALTA DE RECURSO FINANCEIRO']);
 const parent=await page.evaluate(async()=>await (await fetch('/api/v1/tb_encaminhamento/5')).json());
 assert.equal(typeof parent.motivo_nao,'number');assert(parent.motivo_nao>900);
 await page.reload();await page.getByRole('button',{name:'Editar',exact:true}).nth(4).waitFor();await page.getByRole('button',{name:'Editar',exact:true}).nth(4).click();
 await panel.locator('li').first().waitFor();assert.deepEqual(await panel.locator('li').allTextContents(),['FALTA DE RECURSO FINANCEIRO']);
 await boxes.nth(0).uncheck();await panel.getByRole('button',{name:'Salvar coleção',exact:true}).click();await panel.getByText('Coleção salva.',{exact:true}).waitFor();
 assert.equal(await panel.locator('li').count(),0);
 const saved=await page.evaluate(async()=>await (await fetch('/api/v1/tb_encaminhamento/5')).json());assert.equal(saved.motivo_nao,parent.motivo_nao,'clear retains allocated pointer');
 const other=await page.evaluate(async()=>await (await fetch('/api/v1/tb_encaminhamento/3/collections/motivo_nao')).json());assert.equal(other.values[0].value,'FALTA DE RECURSO FINANCEIRO');
 assert.equal(writes.length,3);assert(writes.every(r=>r.method==='PUT'&&r.url.endsWith('/5/collections/motivo_nao')));assert.deepEqual(errors,[]);
 result={status:'passed',sourceOptions:7,explicitSaveOnly:true,discardCancel:true,discardAccept:true,rollbackPreservesDraft:true,reloadPersistence:true,clearPreservesPointer:true,otherParentUnaffected:true,writeRequests:3,errors};
 console.log(JSON.stringify(result,null,2));
} catch(error) {result={status:'failed',message:String(error)};throw error;}
finally {await fs.writeFile(resultFile,JSON.stringify(result));await browser.close();}
