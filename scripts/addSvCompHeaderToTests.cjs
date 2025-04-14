const path = require('path');
const fs = require('fs');

const header = `// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

`;

const folder = path.resolve(__dirname, '..', 'sv-comp_tests');

const addLicenceToFile = (file) => {
  const content = fs.readFileSync(file, 'utf8');
  if (content.startsWith('// This file is part of the SV-Benchmarks')) return;
  const newContent = header + content;
  fs.writeFileSync(file, newContent, 'utf8');
}

fs.readdir(folder, (_, files) => {
  for (const file of files) {
    if (file.endsWith('.c') || file.endsWith('.i')) {
      addLicenceToFile(path.resolve(__dirname, '..', 'sv-comp_tests', file));
    }
  }
});
