// Runs only against the disposable synthetic database owned by the PG test harness.
const {chromium}=await import(process.env.PLAYWRIGHT_MODULE??'playwright-core');
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
const [url,resultFile]=process.argv.slice(2);
if(!url||!resultFile)throw new Error('Expected disposable server URL and result file');
const browser=await chromium.launch({headless:true,channel:'chrome'});
let result;
try{
 const page=await browser.newPage();const errors=[],writes=[],dialogs=[];
 page.on('pageerror',e=>errors.push(String(e)));
 page.on('dialog',async d=>{dialogs.push(d.message());await d.accept();});
 page.on('request',r=>{if(!['GET','HEAD','OPTIONS'].includes(r.method()))writes.push({method:r.method(),path:new URL(r.url()).pathname});});
 await page.goto(url);
 await page.getByText('Nenhum registro carregado.',{exact:true}).waitFor();
 assert.deepEqual(writes,[]);
 await page.getByRole('button',{name:'Novo',exact:true}).click();
 const editor=page.locator('incluir-cad-residencia-page');
 const key=editor.getByPlaceholder('Código definido ao salvar',{exact:true});
 assert.equal(await key.getAttribute('readonly'),'');
 assert.equal(await key.inputValue(),'');
 await editor.locator('input:not([readonly])').fill('Browser synthetic family');
 assert.deepEqual(writes,[],'typing must not write or reserve an ID');
 const responsePromise=page.waitForResponse(r=>r.request().method()==='POST'&&new URL(r.url()).pathname==='/api/v1/cad_residencia');
 await editor.getByRole('button',{name:'Salvar',exact:true}).click();
 const response=await responsePromise;
 assert.equal(response.status(),200);
 const saved=await response.json();
 assert.equal(saved.cod_fam,1);assert.equal(saved.complemento,'Browser synthetic family');
 await editor.waitFor({state:'detached'});
 await page.getByRole('button',{name:'Editar',exact:true}).click();
 assert.equal(await key.inputValue(),'1');assert.equal(await key.getAttribute('readonly'),'');
 assert.deepEqual(writes,[{method:'POST',path:'/api/v1/cad_residencia'}]);
 assert.deepEqual(dialogs,[]);assert.deepEqual(errors,[]);
 result={status:'passed',readonlySourceKey:true,noWriteOnTyping:true,explicitSaveWrites:1,generatedId:1,reloadedId:1,dialogs,errors};
 console.log(JSON.stringify(result,null,2));
}catch(error){result={status:'failed',message:String(error)};throw error;}
finally{await fs.writeFile(resultFile,JSON.stringify(result));await browser.close();}
