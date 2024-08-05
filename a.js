// script to generate commands needed to run to analyze a particular file.
// usage:
// - First argument is path to the file to analyze
// - Second argument is a function name in a file to analyze. Needed because ikos static code analyzer needs an entry point when main is not present.
//   when main is present then still pass main as a second argument
// - Third and later arguments are paths to the include files that the file needs to properly compule.

const fileToAnalyze = process.argv[2];
const file = fileToAnalyze.split('/').splice(-1, 1)[0];
const isCFile = file.endsWith('.c');
const entryPoint = process.argv[3];
const headerDirectories = process.argv.slice(4).map((d) =>
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

const randomColorGenerator = () => {
  const colors = [
    '\x1b[31m', // red
    '\x1b[32m', // green
    '\x1b[33m', // yellow
    '\x1b[34m', // blue
    '\x1b[35m', // magneta
    '\x1b[36m', // cyan
  ];
  return colors[Math.floor(Math.random() * colors.length)];
};

const mainColor = randomColorGenerator();
const accentColor = randomColorGenerator();

const getIncludes = (prefix = '-I', separator = ' ') =>
  !showHeaders
    ? ''
    : `${headerDirectories.map((d) => `${prefix}${d}`).join(separator)} `;

const c = (text, accent = false) =>
  `${accent ? accentColor : mainColor}${text}\x1b[0m`;

const oaf = (name, command) => {
  console.log(`${c(name)}: ${command}\n`);
};

oaf(
  '[ubuntu 22] CLANG',
  `clang${isCFile ? '' : '++'} --analyze -Xclang -analyzer-checker=core,alpha ${
    isCFile
      ? ''
      : '-Xclang -analyzer-config -Xclang aggressive-binary-operation-simplification=true '
  }-ferror-limit=0 ${getIncludes()}${fileToAnalyze}`
);

// oaf(
//   'CLANG-TIDY',
//   `clang-tidy -checks="*,-clang-analyzer-*" -extra-arg=-ferror-limit=0 ${
//     showHeaders ? `${getIncludes('--extra-arg=-I')} ` : ''
//   }${fileToAnalyze}`
// );

oaf(
  '[ubuntu 22] CPPCHECK',
  `cppcheck --force ${getIncludes()}${fileToAnalyze}`
);

oaf(
  '[ubuntu 22] IKOS',
  `ikos -w --globals-init=all ` +
    `-a "boa, dbz, nullity, prover, uva, sio, uio, poa, shc, pcmp, sound, fca, dfa" ` +
    `-f text --rm-db --entry-points=${entryPoint} ${getIncludes()}${fileToAnalyze}`
); //  --status-filter="error,warning" PROBABLY NOT NEEDED

oaf(
  '[ubuntu 22] INFER',
  `infer run --bufferoverrun --pulse-unsafe-malloc --keep-going -- gcc -c ${getIncludes()}${fileToAnalyze} *`
);

oaf(
  '[ubuntu 24] GCC',
  `${isCFile ? 'gcc' : 'g++'} -fanalyzer -c ${getIncludes()}${fileToAnalyze}`
); // -c analyze but do not link. We are not building the file we are only analyzing it so only compiling the file is enough

if (entryPoint === 'main') {
  console.log(
    ` ${c('Verify', true)}: ${
      isCFile ? 'gcc' : 'g++'
    } ${getIncludes()}${fileToAnalyze} -o memory.out -fsanitize=address -static-libasan -g -fno-omit-frame-pointer\n`
  );
}

const headersKey = isCFile ? 'CFLAGS' : 'CPPFLAGS';
oaf(
  '[ubuntu 20] SYMBIOTIC',
  `${
    !showHeaders ? '' : `${headersKey}='${getIncludes().trim()}' `
  }symbiotic --prp=memsafety --malloc-never-fails ${fileToAnalyze}`
);

// greps
for (const noteType of ['error', 'warning', 'note']) {
  console.log(
    `${c(
      '- 2>&1',
      true
    )} | grep -Ec "${fileToAnalyze}:[0-9]+:([0-9]+:)? ${noteType}:"\n`
  );
}
