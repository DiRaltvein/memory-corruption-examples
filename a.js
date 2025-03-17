// script to generate commands needed to run to analyze a particular file.
// usage:
// - First argument is path to the file to analyze
// - Second argument is a function name in a file to analyze. Needed because ikos static code analyzer needs an entry point when main is not present.
//   when main is present then still pass main as a second argument
// - Third and later arguments are paths to the include files that the file needs to properly compule.

const fileToAnalyze = process.argv[2];
const file = fileToAnalyze.split('/').splice(-1, 1)[0];
const isCFile = file.endsWith('.c') || file.endsWith('h');
const entryPoint = process.argv[3];
const headerDirectories = process.argv.slice(4).map((d) =>
  d
    .split('/')
    .map((a) => (a.includes(' ') ? `'${a}'` : a))
    .join('/')
);
const fileNameWithoutExtension = file.split('.').slice(0, -1).join('.');
const filePath = fileToAnalyze
  .split('/')
  .splice(0, fileToAnalyze.split('/').length - 1)
  .join('/');

console.clear();
const showHeaders = headerDirectories.length > 0;

// /usr/llvm-project/llvm/include/llvm <- folder with folders that contain header files

const removeLeadingSlashWithDot = (path) => {
  if (path.startsWith('./')) return path.substring(2);
  return path;
};

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

// ------------------------------------ COMMANDS ------------------------------------ \\

// Clang
oaf(
  '[ubuntu 22] CLANG',
  `/usr/llvm-project/build/bin/clang${isCFile ? '' : '++'} --analyze` +
    ` -Xclang -analyzer-checker=core,alpha.core,security,alpha.security,optin,unix,alpha.unix,nullability${
      isCFile ? '' : ',cplusplus,alpha.cplusplus'
    } -Xclang -analyzer-disable-checker=security.insecureAPI ${
      isCFile
        ? ''
        : '-Xclang -analyzer-config -Xclang aggressive-binary-operation-simplification=true '
    }-ferror-limit=0 ${getIncludes()}${fileToAnalyze}`
);

// if (entryPoint === 'main') {
//   console.log(
//     ` ${c('Verify', true)}: /usr/llvm-project/build/bin/${
//       `clang${isCFile ? '' : '++'}`
//     } ${getIncludes()}${fileToAnalyze} -o memory.out -fsanitize=memory -g -fno-omit-frame-pointer\n`
//   );
// }
// Clang

// oaf(
//   'CLANG-TIDY',
//   `clang-tidy -checks="*,-clang-analyzer-*" -extra-arg=-ferror-limit=0 ${
//     showHeaders ? `${getIncludes('--extra-arg=-I')} ` : ''
//   }${fileToAnalyze}`
// );

// CPPCHECK
oaf(
  '[ubuntu 22*] CPPCHECK',
  `cppcheck --enable=warning,portability --force --inconclusive ${getIncludes()}${fileToAnalyze}`
);
// CPPCHECK

// IKOS
entryPoint &&
  oaf(
    '[ubuntu 22*] IKOS',
    `/home/linuxbrew/.linuxbrew/bin/ikos -w --globals-init=all ` +
      `-a "boa, dbz, nullity, prover, uva, sio, uio, poa, shc, pcmp, sound, fca, dfa" ` +
      `-f text --rm-db --entry-points=${entryPoint} ${getIncludes()}${fileToAnalyze}`
  ); //
// IKOS

// INFER
oaf(
  '[ubuntu 22] INFER',
  `/home/raltvein/infer-linux-x86_64-v1.2.0/bin/infer run --default-checkers --headers --biabduction --biabduction-unsafe-malloc --bufferoverrun --pulse-unsafe-malloc --keep-going -- gcc -c ${getIncludes()}${fileToAnalyze}`
);
// INFER

// gcc
oaf(
  '[ubuntu 22] GCC',
  `/usr/local/gcc-14.2.0/bin/${
    isCFile ? 'gcc' : 'g++'
  } -fanalyzer -Wall -Wextra -Wformat=2 -c ${getIncludes()}${fileToAnalyze}`
); // -c analyze but do not link. We are not building the file we are only analyzing it so only compiling the file is enough

if (entryPoint === 'main') {
  console.log(
    ` ${c('Verify', true)}: /usr/local/gcc-14.2.0/bin/${
      isCFile ? 'gcc' : 'g++'
    } ${getIncludes()}${fileToAnalyze} -o address.out -fsanitize=address -static-libasan -g -fno-omit-frame-pointer\n`
  );
}
// gcc

// // Non-Distinguishable Inconsistencies
// oaf(
//   '[ubuntu 22] NDI',
//   `/usr/ndi/llvm/llvm-project/build/bin/clang${
//     !isCFile ? '++' : ''
//   } -emit-llvm -c ${fileToAnalyze} ${getIncludes()}-o ndi.bc && ` +
//     '/usr/ndi/analyzer/build/lib/kanalyzer ./ndi.bc'
// );
// // Non-Distinguishable Inconsistencies

// // Detecting Missed Security Operations Through Differential Checking of Object-based Similar Paths
// oaf(
//   '[ubuntu 20] IPPO',
//   `/usr/IPPO/llvm/build/bin/clang${
//     !isCFile ? '++' : ''
//   } -fno-inline -g -O2 ${fileToAnalyze} ${getIncludes()}-o ippo.bc && ` +
//     '/usr/IPPO/build/lib/analyzer ./ippo.bc'
// );
// // Detecting Missed Security Operations Through Differential Checking of Object-based Similar Paths

// symbiotic
const headersKey = isCFile ? 'CFLAGS' : 'CPPFLAGS';
oaf(
  '[ubuntu 20] SYMBIOTIC',
  `${
    !showHeaders ? '' : `${headersKey}='${getIncludes().trim()}' `
  }symbiotic --prp=memsafety --malloc-never-fails ${fileToAnalyze}`
);
// symbiotic

// greps
for (const noteType of ['error', 'warning', 'note']) {
  console.log(
    `${c('- 2>&1', true)} | grep -Ec "${removeLeadingSlashWithDot(
      fileToAnalyze
    )}:[0-9]+:([0-9]+:)? ${noteType}:"\n`
  );
}

console.log(
  `${c('- 2>&1', true)} | grep -E "${removeLeadingSlashWithDot(
    fileToAnalyze
  )}:[0-9]+:([0-9]+:)? (error|warning|note):"\n`
);
// greps
