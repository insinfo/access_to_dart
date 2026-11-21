// Synthetic disposable PG database, real FrmEncaminhamento export and generated GET API.
import assert from 'node:assert/strict';import fs from 'node:fs/promises';
const {chromium}=await import(process.env.PLAYWRIGHT_MODULE??'playwright-core');
const [url,resultFile]=process.argv.slice(2);if(!url||!resultFile)throw new Error('Expected disposable URL and result file');
const browser=await chromium.launch({headless:true,channel:'chrome'});let result;
try{
 const page=await browser.newPage();const writes=[],errors=[];let collectionRequests=0;
 page.on('pageerror',e=>errors.push(String(e)));
 page.on('request',r=>{if(!['GET','HEAD','OPTIONS'].includes(r.method()))writes.push(r.method());if(r.url().includes('/collections/motivo_nao'))collectionRequests++;});
 await page.goto(url);await page.getByRole('button',{name:'Editar',exact:true}).nth(3).waitFor();
 const listing=page.locator('table').first();assert(!/motivo_nao: (100|200|300)/.test(await listing.innerText()),'storage pointer must not be presented as selected value');
 const panel=page.locator('access-multivalue-panel');
 async function open(index){await page.getByRole('button',{name:'Editar',exact:true}).nth(index).click();await panel.getByRole('button',{name:'Atualizar coleção',exact:true}).waitFor();await panel.getByText('Carregando coleção...',{exact:true}).waitFor({state:'hidden'});}
 await open(0);await panel.locator('li').nth(2).waitFor();
 assert.deepEqual(await panel.locator('li').allTextContents(),['FALTA DE RECURSO FINANCEIRO','OUTROS','(valor nulo)']);
 assert.equal(await panel.locator('input[type=checkbox]').count(),7);assert.equal(await panel.locator('input:disabled').count(),7);assert.equal(await panel.locator('input:checked').count(),2);
 assert(!(await panel.innerText()).includes('WRONG PARENT PK'));
 // Network fault injection only; successful payloads always come from real PG.
 const matcher='**/api/v1/tb_encaminhamento/1/collections/motivo_nao';
 await page.route(matcher,route=>route.abort('failed'));
 await panel.getByRole('button',{name:'Atualizar coleção',exact:true}).click();await panel.getByText('Não foi possível carregar a coleção. Tente atualizar novamente.',{exact:true}).waitFor();
 assert.equal(await panel.locator('li').count(),0);assert.equal(await panel.locator('input:checked').count(),0);
 await page.unroute(matcher);await panel.getByRole('button',{name:'Atualizar coleção',exact:true}).click();await panel.locator('li').nth(2).waitFor();
 await open(1);await panel.getByText('Nenhum valor selecionado.',{exact:true}).waitFor();assert.equal(await panel.locator('li').count(),0);
 await open(2);await panel.getByText('Nenhum valor selecionado.',{exact:true}).waitFor();assert.equal(await panel.locator('li').count(),0);
 await open(3);await panel.getByText('Exibindo somente os primeiros 100 valores. A coleção possui outros valores.',{exact:true}).waitFor();assert.equal(await panel.locator('li').count(),100);
 const beforeNew=collectionRequests;await page.locator('button:enabled').filter({hasText:/^Novo$/}).click();await panel.getByText('Registro novo: a coleção poderá ser consultada após salvar o registro principal.',{exact:true}).waitFor();assert.equal(collectionRequests,beforeNew);assert.equal(await panel.locator('li').count(),0);assert.equal(await panel.locator('input:checked').count(),0);
 assert.deepEqual(writes,[]);assert.deepEqual(errors,[]);
 result={status:'passed',realExportOptions:7,realGetValues:true,storagePointerHidden:true,nullAndEmpty:true,truncated:true,networkErrorRecovery:true,newParentNoRequest:true,writeRequests:0,errors};console.log(JSON.stringify(result,null,2));
}catch(error){result={status:'failed',message:String(error)};throw error;}
finally{await fs.writeFile(resultFile,JSON.stringify(result));await browser.close();}
