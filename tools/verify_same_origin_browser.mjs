import assert from 'node:assert/strict';
const {chromium} = await import(process.env.PLAYWRIGHT_MODULE ?? 'playwright-core');
const base = process.argv[2];
if(!base) throw new Error('Usage: node verify_same_origin_browser.mjs http://127.0.0.1:PORT');
const browser = await chromium.launch({headless:true, channel:'chrome'});
try {
 const page = await browser.newPage({viewport:{width:1440,height:1000}});
 const errors=[], writes=[], failures=[], api=[], subforms=[];
 page.on('pageerror', error=>errors.push(error.message));
 page.on('request', request=>{
   if(!['GET','HEAD','OPTIONS'].includes(request.method())) writes.push(request.method());
 });
 page.on('response', response=>{
   const path=new URL(response.url()).pathname;
   if(path.startsWith('/api/')) {
     api.push(response.status());
     if(path.includes('/subforms/')) subforms.push(response.status());
     if(response.status()>=400) failures.push(response.status());
   }
 });
 await page.goto(base,{waitUntil:'networkidle'});
 await page.locator('main.content-area').waitFor();
 const familyResponsePromise=page.waitForResponse(response=>new URL(response.url()).pathname==='/api/v1/cad_residencia' && response.request().method()==='GET');
 await page.evaluate(()=>{location.hash='/access-form/cad-residencia';});
 const familyRows=await (await familyResponsePromise).json();
 const family=page.locator('cad-residencia-page');
 await family.waitFor();
 await family.getByRole('button',{name:'Editar',exact:true}).first().waitFor({timeout:30000});
 const listedRows=await family.locator('tbody tr').count();
 assert.ok(listedRows>0,'Actual API rows must render');
 const relatedResponses=Promise.all(['subform_0','subform_1'].map(key=>page.waitForResponse(response=>new URL(response.url()).pathname.endsWith('/subforms/'+key))));
 await family.getByRole('button',{name:'Editar',exact:true}).first().click();
 await page.locator('incluir-cad-residencia-page').waitFor();
 await relatedResponses;
 const editor=page.locator('incluir-cad-residencia-page');
 const selectedKey=await editor.getByPlaceholder('Código definido ao salvar',{exact:true}).inputValue();
 const selectedRow=familyRows.find(row=>String(row.cod_fam)===selectedKey);
 assert.ok(selectedRow,'Selected family must exist in actual API result');
 let nativeDateInputs=0, nonEmptyNativeDateInputs=0;
 for(const [field,placeholder] of [['data_cad','DataCad'],['data_deslig_resid','DataDesligResid'],['dataatcad','DATAATCAD']]) {
   const input=editor.getByPlaceholder(placeholder,{exact:true});
   assert.equal(await input.getAttribute('type'),'date');
   const value=selectedRow[field];
   const expected=value==null?'':String(value).slice(0,10);
   assert.ok(expected==='' || /^\d{4}-\d{2}-\d{2}$/.test(expected),'API date must have civil ISO components');
   assert.ok(await input.inputValue()===expected,'Native date differs from API field '+field);
   nativeDateInputs++;
   if(expected!=='')nonEmptyNativeDateInputs++;
 }

 await page.waitForFunction(()=>[...document.querySelectorAll('access-subform-panel')].every(panel=>!panel.textContent.includes('Carregando...')));
 assert.equal(await page.locator('access-subform-panel .text-danger').count(),0,'Related data must render without component errors');
 const relatedRows=await page.locator('access-subform-panel tbody tr').count();
 const panels=await page.locator('access-subform-panel').count();
 assert.equal(panels,2,'Both real relationship panels should render');
 assert.ok(subforms.length>=2,'Both panels must request actual API data');
 assert.ok(subforms.every(status=>status===200),'Subform requests must succeed');
 assert.ok(api.length>2,'No mocked API: expected real requests');
 assert.deepEqual(failures,[],'Unexpected API failures');
 assert.deepEqual(writes,[],'Read-only browser validation must not write');
 assert.deepEqual(errors,[],'Generated runtime errors');
 console.log(JSON.stringify({status:'passed',origin:new URL(base).origin,listedRows,relatedRows,nativeDateInputs,nonEmptyNativeDateInputs,subformPanels:panels,subformResponses:subforms.length,apiResponses:api.length,writes:writes.length,runtimeErrors:errors.length,apiFailures:failures.length},null,2));
} finally { await browser.close(); }
