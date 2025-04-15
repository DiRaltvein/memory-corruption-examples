// https://tableconvert.com/markdown-to-csv
import cves from '../table.json' assert { type: 'json' };

import {
  CategoryScale,
  Chart,
  LinearScale,
  LineController,
  LineElement,
  PointElement,
  BarController,
  BarElement,
  LogarithmicScale,
} from 'chart.js';
import { Canvas } from 'skia-canvas';
import fsp from 'node:fs/promises';
import lodash from 'lodash';

const syntheticCveIds = ['Vuln', 'Fix', 'Found']

const cveIsParent = (cve) => syntheticCveIds.indexOf(cve.id) === -1
const gerParentCve = (cve) => {
  if (cveIsParent(cve)) return cve;
  for (let i = cves.indexOf(cve) - 1; i >= 0; --i) {
    const potentialParentCVE = cves[i];
    if (syntheticCveIds.indexOf(potentialParentCVE.id) === -1) return potentialParentCVE;
  }
  return null;
}
const getCveNumber = (cve) => gerParentCve(cve).CVE
const getCategories = (cve) => gerParentCve(cve)['vuln. type'].split('/')

const calculateForTestSuit = process.argv[2] === 'test-suite';

const cvesToAnalyze = cves.filter(
  (cve) =>
    (calculateForTestSuit && (cve.id === 'Vuln' || cve.id === 'Found')) ||
    (!calculateForTestSuit && syntheticCveIds.indexOf(cve.id) === -1)
);
const patchedCves = !calculateForTestSuit
  ? []
  : cves.filter((cve) => cve.id === 'Fix');

const analyzersToUse = [
  'clang',
  'cppcheck',
  'ikos',
  'infer',
  'gcc',
  ...(calculateForTestSuit ? ['symbiotic'] : []),
];


// ----------------------------- File/Function length stats ---------------------------- \\
const allFileLengths = [];
const allVulnFunctionsLengths = [];

for (const cve of cvesToAnalyze) {
  allFileLengths.push(parseInt(cve['file len']));
  allVulnFunctionsLengths.push(parseInt(cve['func len']));
}

console.log('Vulnerable file length:');
console.log('max: ', Math.max(...allFileLengths));
console.log('min: ', Math.min(...allFileLengths));
console.log(
  'avg: ',
  Math.round(
    allFileLengths.reduce((sum, l) => sum + l, 0) / allFileLengths.length
  )
);

console.log('\nVulnerable function length:');
console.log('max: ', Math.max(...allVulnFunctionsLengths));
console.log('min: ', Math.min(...allVulnFunctionsLengths));
console.log(
  'avg: ',
  Math.round(
    allVulnFunctionsLengths.reduce((sum, l) => sum + l, 0) /
      allVulnFunctionsLengths.length
  )
);
// ----------------------------- File/Function length stats ---------------------------- \\


// ----------------------------- CWE CATEGORIES ---------------------------- \\
if (!calculateForTestSuit) {
  const categories = cvesToAnalyze.reduce((acc, cve) => {
    const categories = getCategories(cve);
    for (const cat of categories) {
      acc[cat] = (acc[cat] ?? 0) + 1;
    }
    return acc;
  }, {});
  console.log(
    '\ncategories: ',
    lodash.pick(categories, Object.keys(categories).sort())
  );
  console.log(
    'total: ',
    Object.values(categories).reduce((acc, c) => acc + c, 0)
  );
}

// ----------------------------- CWE CATEGORIES ---------------------------- \\


// ----------------------------- STATIC CODE ANALYZER RESULTS ---------------------------- \\
for (const analyzer of analyzersToUse) {
  const error = cvesToAnalyze.concat(patchedCves).reduce(
    (acc, cve) => (acc += cve[analyzer] === '✖' ? 1 : 0),
    0
  );
  const failed = cvesToAnalyze.reduce(
    (acc, cve) => (acc += cve[analyzer].includes('✖/✖') ? 1 : 0),
    0
  );
  const success = cvesToAnalyze.reduce(
    (acc, cve) => (acc += cve[analyzer].includes('✓') ? 1 : 0),
    0
  );
  const successIn5Rows = cvesToAnalyze.reduce(
    (acc, cve) => (acc += cve[analyzer].includes('✓/✓') ? 1 : 0),
    0
  );
  const numberOfNotes = {
    notes: 0,
    warnings: 0,
    errors: 0,
  };
  for (const cve of cvesToAnalyze) {
    if (cve[analyzer].length < 5) continue;
    const notes = cve[analyzer].split('(')[0];
    const notesSplit = notes.split('/');
    if (notesSplit.length !== 3)
      console.error('cve', cve, analyzer, 'could not parse stats');
    numberOfNotes.notes += parseInt(notesSplit[2]);
    numberOfNotes.warnings += parseInt(notesSplit[1]);
    numberOfNotes.errors += parseInt(notesSplit[0]);
  }
  const numberOfNotesOverall = { ...numberOfNotes }; // with patched cases
  for (const cve of patchedCves) {
    if (cve[analyzer].length < 5) continue;
    const notes = cve[analyzer].split('(')[0];
    const notesSplit = notes.split('/');
    if (notesSplit.length !== 3)
      console.error('cve', cve, analyzer, 'could not parse stats');
    numberOfNotesOverall.notes += parseInt(notesSplit[2]);
    numberOfNotesOverall.warnings += parseInt(notesSplit[1]);
    numberOfNotesOverall.errors += parseInt(notesSplit[0]);
  }
  console.log(`\n${analyzer} statistics:`);
  console.log(
    'errors: ',
    error,
    ' failed (FN): ',
    failed,
    ' success (TP): ',
    success,
    ' success in first 5 rows: ',
    successIn5Rows
  );
  console.log(
    'total num of notes: ',
    numberOfNotesOverall.errors + numberOfNotesOverall.warnings + numberOfNotesOverall.notes,
    ' errors: ',
    numberOfNotesOverall.errors,
    ' warnings: ',
    numberOfNotesOverall.warnings,
    ' notes: ',
    numberOfNotesOverall.notes
  );
  if (patchedCves.length > 0) {
    const falsePositives = patchedCves.filter((cve) =>
      cve[analyzer].length > 1 && cve[analyzer].includes('✖')
    ).length;
    const trueNegative = patchedCves.filter((cve) =>
      cve[analyzer].includes('✓')
    ).length;
    console.log(
      'False Positive (FP): ',
      falsePositives,
      ' True Negative (TN): ',
      trueNegative
    );

    // failed is FN as tool outputted that file has no error while error was there
    // success is TP because tool outputted that file has error while error was there
    console.log(
      'True Positive Rate (TPR): ',
      (success / (success + failed)).toFixed(4),
      ' False Positive Rate (FPR): ',
      (falsePositives / (falsePositives + trueNegative)).toFixed(4),
      ' TPR - FPR + 1: ',
      ((success / (success + failed)) - (falsePositives / (falsePositives + trueNegative)) + 1).toFixed(4),
      ' Diagnostic Efficiency (DE): ',
      (success / (numberOfNotes.errors + numberOfNotes.warnings + numberOfNotes.notes)).toFixed(4)
    );
  } else {
    // failed is FN as tool outputted that file has no error while error was there
    // success is TP because tool outputted that file has error while error was there
    console.log(
      'True Positive Rate (TPR): ',
      (success / (success + failed)).toFixed(4),
      ' Diagnostic Efficiency (DE): ',
      (success / (numberOfNotes.errors + numberOfNotes.warnings + numberOfNotes.notes)).toFixed(4)
    );
  }
}
// ----------------------------- STATIC CODE ANALYZER RESULTS ---------------------------- \\


Chart.register([
  BarController,
  LogarithmicScale,
  BarElement,
  CategoryScale,
  LineController,
  LineElement,
  LinearScale,
  PointElement,
]);

// File len graph
const canvas = new Canvas(1920, 1200);
const fileLenChart = new Chart(canvas, {
  type: 'bar',
  data: {
    labels: cvesToAnalyze.map(getCveNumber),
    datasets: [
      {
        data: cvesToAnalyze.map((c) => parseInt(c['file len'])),
        borderWidth: 1,
      },
    ],
  },
  options: {
    scales: {
      y: {
        type: 'logarithmic',
        title: {
          display: true,
          text: 'File length',
        },
      },
    },
  },
});

const fileLenPngBuffer = await canvas.toBuffer('png', { matte: 'white' });
await fsp.writeFile(
  `charts/fileLenChart${calculateForTestSuit ? '-suit' : ''}.png`,
  fileLenPngBuffer
);
fileLenChart.destroy();
//

// function len graph
const funcChart = new Chart(canvas, {
  type: 'bar',
  data: {
    labels: cvesToAnalyze.map(getCveNumber),
    datasets: [
      {
        data: cvesToAnalyze.map((c) => parseInt(c['func len'])),
        borderWidth: 1,
      },
    ],
  },
  options: {
    scales: {
      y: {
        type: 'logarithmic',
        title: {
          display: true,
          text: 'Function length',
        },
      },
    },
  },
});

const funcPngBuffer = await canvas.toBuffer('png', { matte: 'white' });
await fsp.writeFile(
  `charts/funcChart${calculateForTestSuit ? '-suit' : ''}.png`,
  funcPngBuffer
);
funcChart.destroy();
//

const sortedFuncLengths = lodash.sortBy(cvesToAnalyze, (c) =>
  parseInt(c['func len'])
);
const buckets = lodash.chunk(sortedFuncLengths, 5);

const getDetectionRateInBucket = (bucket, analyzers) => {
  let overallDetectedVulnerabilities = 0;

  for (const vuln of bucket) {
    for (const analyzer of analyzers) {
      if (vuln[analyzer]?.includes('✓')) overallDetectedVulnerabilities++;
    }
  }

  return (
    (overallDetectedVulnerabilities / (bucket.length * analyzers.length)) * 100
  );
};

// generate a graph that would show how ability to detect scales with function size
// Line graph where x would be function length where vulnerabilit happened (by buckets) found and y would be % of vulnerabilities found

// % of vulnerabilities detected is just a sum of all detected cases divided by total cases and mltiplied by 100.
//  For example, if one test case was correctly identified by 2 static code analyzers out of 5 and another test case was correctly identified by 1 static code analzer then the detection rate is
// (2 + 1) / (2 * 5) * 100    <- total number of correctly identified cases divided by total number of identifications (in total 10 as 5 static code analyzers and 2 different test cases) multiplied by 100 to get percentage in range [0, 100]
const detectedVulnsRatioByFuncLen = new Chart(canvas, {
  type: 'line',
  data: {
    yLabels: '%',
    labels: buckets.map(
      (bucket) =>
        `${bucket[0]['func len']} - ${bucket[bucket.length - 1]['func len']}`
    ),
    datasets: [
      {
        data: buckets.map((b) => getDetectionRateInBucket(b, analyzersToUse)),
      },
    ],
  },
  options: {
    scales: {
      y: {
        title: {
          display: true,
          text: '% of vulnerabilities detected',
        },
      },
      x: {
        title: {
          display: true,
          text: 'Length of function containing vulnerability',
        },
      },
    },
  },
});

const detectedVulnsPngBuffer = await canvas.toBuffer('png', { matte: 'white' });
await fsp.writeFile(
  `charts/detectedVulnsRatioByFuncLen${
    calculateForTestSuit ? '-suit' : ''
  }.png`,
  detectedVulnsPngBuffer
);
detectedVulnsRatioByFuncLen.destroy();
//
