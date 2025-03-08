import fs from 'fs';
import { parse } from 'node-html-parser';

// This script is used to query pages from https://www.cvedetails.com and to gather all CVE's who have a github link attached to the CVE.
// Extracted CVE's are saved into cves.json file

const cvesFile = '../cves.json';

const base = 'https://www.cvedetails.com';
const urls = [
  // filter on Memory corruption
  '/vulnerability-list/year-2023/vulnerabilities.html?page=1&opmemc=1&cvssscoremin=7&order=3&trc=2798&sha=56f214f9adef32acf96792d39bffd5607ae3c835',
  // filter on Overflow
  '/vulnerability-list/year-2023/vulnerabilities.html?page=1&opov=1&cvssscoremin=7&order=3&trc=1752&sha=4ae91d54bdbef4601bd9c4cdb3252519105763a4',
];

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
  const foundCves = [];

  // iterate over 2 categories
  for (const firstPageUrl of urls) {
    let nextPageUrl = firstPageUrl;
    let pageCounter = 1;
    while (nextPageUrl) {
      const page = await getAPage(`${base}${nextPageUrl}`);
      const cveATags = page.querySelectorAll(
        "div.row > h3 > a[href^='/cve/CVE-']"
      );
      console.log(`page ${pageCounter++}, found ${cveATags.length} cve links.`);
      console.log(`currently saved ${foundCves.length} CVE's`);

      // at each page go to CVE details and if there is a github link add this CVE into foundCves list
      for (let j = 0; j < cveATags.length; j++) {
        const cveUrl = `${base}${cveATags[j].attributes.href}`;
        const cvePage = await getAPage(cveUrl);
        const hasGithubLink = cvePage.querySelector(
          "li.list-group-item > a[href^='https://github.com/']"
        );
        // console.log(
        //   `CVE: ${cveATags[j].attributes.href}. Accepted: ${
        //     hasGithubLink ? 'yes' : 'no'
        //   }`
        // );
        if (hasGithubLink && !foundCves.includes(cveUrl)) {
          foundCves.push(cveUrl);
        }
      }

      // find a url to the next page from paging section
      nextPageUrl = page
        .querySelectorAll('main > div.paging > a')
        .find((a) => a.text == pageCounter)?.attributes.href;
    }
  }

  fs.writeFileSync(
    cvesFile,
    JSON.stringify(
      foundCves.map((url) => ({
        url,
        picked: false,
        reason: -1,
        notes: '',
      })),
      null,
      2
    )
  );
}

main();
