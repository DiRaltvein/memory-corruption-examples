import fs from 'fs';
import cves from '../table.json' assert { type: 'json' };
import { parse } from 'node-html-parser';

const base = 'https://www.cvedetails.com/cve/';

// fetch a html page and parse it using node-html-parser. It is extracted into a separate method because cvedetails uses a cloudflare and it often responds with 429
async function getAPage(url) {
  const page = await fetch(url);
  if (page.status === 429) {
    console.log('retry...');
    await new Promise((res) => setTimeout(res, 20_000));
    return getAPage(url);
  }
  return parse(await page.text());
}

async function main() {
  for (const cve of cves) {
    if (cve.id === 'Vuln' || cve.id === 'Fix') continue;
    const page = await getAPage(`${base}${cve.CVE}`);
    cve['vuln. type'] = Array.from(
      page.querySelectorAll('a[title$="- CWE definition"]')
    )
      .filter((el) => el._rawAttrs.title)
      .map((el) => el._rawAttrs.title.replace(' - CWE definition', '').trim())
      .join('/');
    console.log(cve.CVE, ' - ', cve['vuln. type']);
  }

  fs.writeFileSync('table.json', JSON.stringify(cves, null, 2));
}

main();
