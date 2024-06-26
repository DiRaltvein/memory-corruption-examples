// script to generate commands needed to run to analyze a particular file.

const fileToAnalyze = process.argv[2];
const headerDirectories = process.argv.slice(3).map((d) =>
  d
    .split('/')
    .map((a) => (a.includes(' ') ? `'${a}'` : a))
    .join('/')
);

console.clear();
const showHeaders = headerDirectories.length > 0;

// // windows header files
// headerDirectories.join(
//   "/mnt/c/'Program Files (x86)'/'Windows Kits'/10/Include/10.0.22621.0/shared"
// );

// /usr/llvm-project/llvm/include/llvm <- folder with folders that contain header files

const getIncludes = (prefix = '-I', separator = ' ') =>
  !showHeaders
    ? ''
    : headerDirectories.map((d) => `${prefix}${d}`).join(separator);

const oaf = (name, str, showGreps = true) => {
  const finalCommand = `${str} 2>&1 | grep ${fileToAnalyze}:`;
  console.log(`\x1b[31m${name}\x1b[0m: ${finalCommand}\n`);
  if (!showGreps) return;
  for (const grep of [
    '| grep -c "error:"',
    '| grep -c "warning:"',
    '| grep -c "note:"',
  ]) {
    console.log(`\x1b[43m-\x1b[0m ${finalCommand} ${grep}\n`);
  }
};

if (fileToAnalyze.endsWith('.c')) {
  oaf(
    'CLANG',
    `/usr/llvm-project/build/bin/clang --analyze -ferror-limit=0 ${getIncludes()} ${fileToAnalyze}`
  );
} else {
  oaf(
    'CLANG',
    `/usr/llvm-project/build/bin/clang++ --analyze -ferror-limit=0 ${getIncludes()} ${fileToAnalyze}`
  );
}
oaf(
  'CLANG-TIDY',
  `/usr/llvm-project/build/bin/clang-tidy -extra-arg=-ferror-limit=0 ${getIncludes(
    '--extra-arg=-I'
  )} ${fileToAnalyze}`
);
oaf(
  'CPPCHECK',
  `cppcheck --enable=all --suppress=missingIncludeSystem --suppress=unmatchedSuppression --force ${getIncludes()} ${fileToAnalyze}`,
  false
);
// oaf('INFER', `infer run -- clang --keep-going ${fileToAnalyze}`, false);
if (fileToAnalyze.endsWith('.c')) {
  oaf(
    'SYMBIOTIC',
    `${
      !showHeaders ? '' : `CFLAGS='${getIncludes()}'`
    } /usr/symbiotic/scripts/symbiotic --prp=memsafety --malloc-never-fails ${fileToAnalyze}`
  );
} else {
  oaf(
    'SYMBIOTIC',
    `${
      !showHeaders ? '' : `CPPFLAGS='${getIncludes()}'`
    } /usr/symbiotic/scripts/symbiotic-cc --prp=memsafety --malloc-never-fails ${fileToAnalyze}`
  );
}
