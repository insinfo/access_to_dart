// Runs only against the disposable synthetic database owned by the PG test harness.
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
const { chromium } = await import(process.env.PLAYWRIGHT_MODULE ?? 'playwright-core');
const [url, resultFile] = process.argv.slice(2);
if (!url || !resultFile) {
  throw new Error('Expected disposable URL and result file');
}

const browser = await chromium.launch({ headless: true, channel: 'chrome' });
let result;
try {
  const page = await browser.newPage({ viewport: { width: 1280, height: 1400 } });
  const errors = [];
  const writes = [];
  const apiFailures = [];
  let reportApiCalled = false;
  let assetOk = false;

  page.on('pageerror', (err) => errors.push(String(err)));
  page.on('request', (req) => {
    if (!['GET', 'HEAD', 'OPTIONS'].includes(req.method())) {
      writes.push({ method: req.method(), url: req.url() });
    }
  });
  page.on('response', (res) => {
    const pathname = new URL(res.url()).pathname;
    if (pathname.startsWith('/api/v1/access-reports/')) {
      if (pathname.endsWith('/assets/logo-SUAS-ICON.png')) {
        assetOk = res.status() === 200;
      } else {
        reportApiCalled = res.status() === 200;
      }
      if (res.status() >= 400) {
        apiFailures.push({ status: res.status(), url: res.url() });
      }
    }
  });

  await page.goto(url, { waitUntil: 'networkidle' });
  await page.evaluate(() => {
    location.hash = '/access-report/prontuario_16_registro_sintetico_fr_verso';
  });

  const viewer = page.locator('access-report-viewer');
  await viewer.waitFor();
  const paramInput = viewer.locator('[data-access-report-param="p0"]');
  await paramInput.waitFor();
  await paramInput.fill('4242');
  await viewer.getByRole('button', { name: 'Visualizar Relatório', exact: true }).click();

  const sheet = viewer.locator('[data-access-report="prontuario_16_registro_sintetico_fr_verso"]');
  await sheet.waitFor();

  const controlCount = await sheet.locator('[data-access-control]').count();
  assert.equal(controlCount, 38, 'Expected all 38 controls in DOM');

  const codFamText = await sheet.locator('[data-access-control="CadResidencia.CodFam"]').innerText();
  assert.equal(codFamText.trim(), '4242');

  const nomeText = await sheet.locator('[data-access-control="Nome"]').innerText();
  assert.equal(nomeText.trim(), 'FAMILIA SINTETICA - TESTE DE FIDELIDADE');

  const rotulo103Text = await sheet.locator('[data-access-control="Rótulo103"]').textContent();
  assert.ok(/\u00a0{2,}|\s{2,}/.test(rotulo103Text ?? ''), 'Expected preserved alignment spaces in Rótulo103');

  const imgBox = await sheet.locator('[data-access-control="Imagem96"] img').evaluate((img) => ({
    complete: img.complete,
    naturalWidth: img.naturalWidth,
    naturalHeight: img.naturalHeight,
  }));
  assert.equal(imgBox.complete, true, 'Logo image must finish loading');
  assert.ok(imgBox.naturalWidth > 0, 'Logo image naturalWidth must be > 0');

  const boxes = await sheet.locator('[data-access-control]').evaluateAll((els) =>
    els.map((el) => {
      const r = el.getBoundingClientRect();
      const s = getComputedStyle(el);
      return {
        name: el.getAttribute('data-access-control'),
        type: el.getAttribute('data-access-control-type'),
        w: r.width,
        h: r.height,
        bg: s.backgroundColor,
        border: s.borderTopStyle,
      };
    })
  );
  assert.ok(boxes.every((b) => b.w > 0 && b.h > 0), 'Every control must have non-zero geometry');
  const box65 = boxes.find((b) => b.name === 'Caixa65');
  assert.equal(box65.type, 'Rectangle');
  assert.equal(box65.border, 'solid');

  assert.equal(reportApiCalled, true);
  assert.equal(assetOk, true);
  assert.deepEqual(writes, []);
  assert.deepEqual(apiFailures, []);
  assert.deepEqual(errors, []);
  if (process.env.REPORT16_SCREENSHOT) {
    await sheet.screenshot({ path: process.env.REPORT16_SCREENSHOT });
  }

  result = {
    status: 'passed',
    controlCount,
    codFamText: codFamText.trim(),
    nomeText: nomeText.trim(),
    imgBox,
    writes: writes.length,
    errors,
  };
  console.log(JSON.stringify(result, null, 2));
} catch (error) {
  result = { status: 'failed', message: String(error) };
  console.error(JSON.stringify(result, null, 2));
  throw error;
} finally {
  await fs.writeFile(resultFile, JSON.stringify(result, null, 2));
  await browser.close();
}
