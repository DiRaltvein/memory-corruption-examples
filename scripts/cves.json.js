import cves from '../cves.json' assert { type: 'json' };

// Reason is an enum field that can have following values:
// -1 - not looked at yet
// 0 - picked
// 1 - no source code
// 2 - error is not valid (not memory corruption/not C or C++)
// 3 - could not determine cause

console.log('total: ' + cves.length);
console.log(
  cves.reduce((acc, cve) => {
    acc[cve.reason] = (acc[cve.reason] ?? 0) + 1;
    return acc;
  }, {})
);
