// https://tableconvert.com/markdown-to-csv
import cves from '../table.json' assert { type: 'json' };

import { CategoryScale, Chart, LinearScale, LineController, LineElement, PointElement, BarController, BarElement, LogarithmicScale } from 'chart.js';
import { Canvas } from 'skia-canvas';
import fsp from 'node:fs/promises';
import lodash from 'lodash';

const calculateForTestSuit = false;

const cvesToAnalyze = cves.filter(cve => (calculateForTestSuit && !cve.id) || (!calculateForTestSuit && cve.id));
const analyzersToUse = [
  'clang',
  'cppcheck',
  'ikos',
  'infer',
  'gcc',
  ...(calculateForTestSuit ? ['symbiotic'] : []),
]

const allFileLengths = [];
const allVulnFunctionsLengths = [];

for (const cve of cvesToAnalyze) {
  allFileLengths.push(parseInt(cve['file len']));
  allVulnFunctionsLengths.push(parseInt(cve['func len']));
}

// Simple console log stats
console.log('Vulnerable file length:');
console.log('max: ', Math.max(...allFileLengths));
console.log('min: ', Math.min(...allFileLengths));
console.log('avg: ', Math.round(allFileLengths.reduce((sum, l) => sum + l, 0) / allFileLengths.length));

console.log('\nVulnerable function length:');
console.log('max: ', Math.max(...allVulnFunctionsLengths));
console.log('min: ', Math.min(...allVulnFunctionsLengths));
console.log('avg: ', Math.round(allVulnFunctionsLengths.reduce((sum, l) => sum + l, 0) / allVulnFunctionsLengths.length));

for (const analyzer of analyzersToUse) {
  const error = cvesToAnalyze.reduce((acc, cve) => acc += cve[analyzer] === '✖' ? 1 : 0, 0);
  const failed = cvesToAnalyze.reduce((acc, cve) => acc +=  (cve[analyzer].includes('✖/✖') ? 1 : 0), 0);
  const success = cvesToAnalyze.reduce((acc, cve) => acc += (cve[analyzer].includes('✓') ? 1 : 0), 0);
  const successIn5Rows = cvesToAnalyze.reduce((acc, cve) => acc += (cve[analyzer].includes('✓/✓') ? 1 : 0), 0);
  const numberOfNotes = {
    notes: 0,
    warnings: 0,
    errors: 0
  };
  for (const cve of cvesToAnalyze) {
    if (cve[analyzer].length < 5) continue;
    const notes = cve[analyzer].split('(')[0];
    const notesSplit = notes.split('/');
    if (notesSplit.length !== 3) console.error('cve', cve, analyzer, 'could not parse stats');
    numberOfNotes.notes += parseInt(notesSplit[2]);
    numberOfNotes.warnings += parseInt(notesSplit[1]);
    numberOfNotes.errors += parseInt(notesSplit[0]);
  }
  console.log(`\n${analyzer} statistics:`)
  console.log('errors: ', error, ' failed: ', failed, ' success: ', success, ' success in first 5 rows: ', successIn5Rows);
  console.log('total num of notes: ', numberOfNotes.errors + numberOfNotes.warnings + numberOfNotes.notes, ' errors: ', numberOfNotes.errors, 'warnings: ', numberOfNotes.warnings, ' notes: ', numberOfNotes.notes);
}
// Simple console log stats


Chart.register([
  BarController,
  LogarithmicScale,
  BarElement,
  CategoryScale,
  LineController,
  LineElement,
  LinearScale,
  PointElement
]);

//
const canvas = new Canvas(1920, 1200);
const fileLenChart = new Chart(
  canvas,
  {
    type: 'bar',
    data: {
      labels: cvesToAnalyze.map(c => c.CVE),
      datasets: [{
        data: cvesToAnalyze.map(c => parseInt(c['file len'])),
        borderWidth: 1,
      }]
    },
    options: {
      scales: {
        y: {
          type: 'logarithmic',
          title: {
            display: true,
            text: 'File length'
          }
        },
      }
    }
  }
);

const fileLenPngBuffer = await canvas.toBuffer('png', {matte: 'white'});
await fsp.writeFile(`charts/fileLenChart${calculateForTestSuit ? '-suit' : ''}.png`, fileLenPngBuffer);
fileLenChart.destroy();
//

//
const funcChart = new Chart(
  canvas,
  {
    type: 'bar',
    data: {
      labels: cvesToAnalyze.map(c => c.CVE),
      datasets: [{
        data: cvesToAnalyze.map(c => parseInt(c['func len'])),
        borderWidth: 1,
      }]
    },
    options: {
      scales: {
        y: {
          type: 'logarithmic',
          title: {
            display: true,
            text: 'Function length'
          }
        },
      }
    }
  }
);

const funcPngBuffer = await canvas.toBuffer('png', {matte: 'white'});
await fsp.writeFile(`charts/funcChart${calculateForTestSuit ? '-suit' : ''}.png`, funcPngBuffer);
funcChart.destroy();
//

const sortedFuncLengths = lodash.sortBy(cvesToAnalyze, (c => parseInt(c['func len'])));
const buckets = lodash.chunk(sortedFuncLengths, 5);

const getDetectionRateInBucket = (bucket, analyzers) => {
  let overallDetectedVulnerabilities = 0;

  for (const vuln of bucket) {
    for (const analyzer of analyzers) {
      if (vuln[analyzer]?.includes('✓')) overallDetectedVulnerabilities++;
    }
  }

  return (overallDetectedVulnerabilities / (bucket.length * analyzers.length)) * 100;
}

// generate a graph that would show how ability to detect scales with function size
// Line graph where x would be function length where vulnerabilit happened (by buckets) found and y would be % of vulnerabilities found

// % of vulnerabilities detected is just a sum of all detected cases divided by total cases and mltiplied by 100.
//  For example, if one test case was correctly identified by 2 static code analyzers out of 5 and another test case was correctly identified by 1 static code analzer then the detection rate is
// (2 + 1) / (2 * 5) * 100    <- total number of correctly identified cases divided by total number of identifications (in total 10 as 5 static code analyzers and 2 different test cases) multiplied by 100 to get percentage in range [0, 100]
const detectedVulnsRatioByFuncLen = new Chart(
  canvas,
  {
    type: 'line',
    data: {
      yLabels: '%',
      labels: buckets.map(bucket => `${bucket[0]['func len']} - ${bucket[bucket.length - 1]['func len']}`),
      datasets: [{
        data: buckets.map(b => getDetectionRateInBucket(b, analyzersToUse))
      }]
    },
    options: {
      scales: {
        y: {
          title: {
            display: true,
            text: '% of vulnerabilities detected'
          }
        },
        x: {
          title: {
            display: true,
            text: 'Length of function containing vulnerability'
          }
        }
      }
    }
  }
);

const detectedVulnsPngBuffer = await canvas.toBuffer('png', {matte: 'white'});
await fsp.writeFile(`charts/detectedVulnsRatioByFuncLen${calculateForTestSuit ? '-suit' : ''}.png`, detectedVulnsPngBuffer);
detectedVulnsRatioByFuncLen.destroy();
//


//
const detectedVulnsRatioByFuncLenIkos = new Chart(
  canvas,
  {
    type: 'line',
    data: {
      yLabels: '%',
      labels: buckets.map(bucket => `${bucket[0]['func len']} - ${bucket[bucket.length - 1]['func len']}`),
      datasets: [{
        data: buckets.map(b => getDetectionRateInBucket(b, ['ikos']))
      }]
    },
    options: {
      scales: {
        y: {
          title: {
            display: true,
            text: '% of vulnerabilities detected'
          }
        },
        x: {
          title: {
            display: true,
            text: 'Length of function containing vulnerability'
          }
        }
      }
    }
  }
);

const detectedVulnsIkosPngBuffer = await canvas.toBuffer('png', {matte: 'white'});
await fsp.writeFile(`charts/detectedVulnsRatioByFuncLenIkos${calculateForTestSuit ? '-suit' : ''}.png`, detectedVulnsIkosPngBuffer);
detectedVulnsRatioByFuncLenIkos.destroy();
//