const {chromium} = await import(process.env.PLAYWRIGHT_MODULE ?? 'playwright-core');
import http from 'node:http';
import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
if (!process.argv[2]) throw new Error('Usage: node verify_openform_navigation.mjs PACKAGED_WEB_DIRECTORY');
const root=path.resolve(process.argv[2]);
for (const required of ['index.html', 'main.dart.js']) {
 assert.ok((await fs.stat(path.join(root,required))).size > 0, 'Missing/empty build artifact: '+required);
}
const server=http.createServer(async(req,res)=>{
  try {
    const requested=decodeURIComponent(new URL(req.url,'http://localhost').pathname);
    const file=path.resolve(root,'.'+(requested==='/'?'/index.html':requested));
    if(!file.startsWith(root+path.sep)) {res.writeHead(403).end();return;}
    res.setHeader('Content-Type',file.endsWith('.js')?'text/javascript':file.endsWith('.css')?'text/css':file.endsWith('.html')?'text/html':'application/octet-stream');
    res.end(await fs.readFile(file));
  } catch {res.writeHead(404).end();}
});
await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));
const browser=await chromium.launch({headless:true,...(process.env.CHROME_PATH ? {executablePath:process.env.CHROME_PATH} : {channel:'chrome'})});
try {
 const page=await browser.newPage({viewport:{width:1440,height:1000}});
 const errors=[],writes=[];
 page.on('pageerror',e=>errors.push(String(e)));
 await page.route('**/api/**',async route=>{
  const req=route.request(); if(!['GET','OPTIONS'].includes(req.method()))writes.push(req.method()+' '+req.url());
  await route.fulfill({contentType:'application/json',body:JSON.stringify({items:[],total:0,offset:0,limit:50})});
 });
 await page.goto('http://127.0.0.1:'+server.address().port);
 await page.locator('tb-atend-page').waitFor();
 await page.getByRole('button',{name:'Novo',exact:true}).click();
 const link=page.locator('a[href="#/access-form/tb-beneficio-emergencial"]');
 await link.waitFor();
 const label=await link.innerText();
 await link.click();
 await page.locator('tb-beneficio-emergencial-page').waitFor();
 assert.match(await page.locator('main.content-area').innerText(),/eventos de abertura e janela do formulário original ainda não reproduzidos/);
 assert.equal(await page.locator('incluir-tb-beneficio-emergencial-page').count(),0,'navigation must not automatically open editor or create records');
 await page.evaluate(()=>{location.hash='/access-form/does-not-exist';});
 await page.waitForFunction(()=>location.hash.includes('does-not-exist'));
 assert.equal(await page.locator('tb-beneficio-emergencial-page').count(),1,'unknown route must not replace the active module');
 assert.deepEqual(writes,[]);
 assert.deepEqual(errors,[]);
 await page.screenshot({path:path.join(path.dirname(root),'openform-browser.png'),fullPage:true});
 console.log(JSON.stringify({status:'passed',clickedLabel:label,target:'tb-beneficio-emergencial',navigation:'partial/module-only',automaticEditor:false,unknownRouteIgnored:true,writes,errors},null,2));
} finally {await browser.close();await new Promise(resolve=>server.close(resolve));}
