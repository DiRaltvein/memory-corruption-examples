const path = require('path');
const fs = require('fs');

const folder = path.resolve(__dirname, 'realworld_simplified');

function createFile(path, filename) {
  const content = `format_version: '2.0'

input_files: '${filename}'

properties:
  - property_file: ../properties/valid-memsafety.prp
    expected_verdict: false
  - property_file: ../properties/no-overflow.prp
    expected_verdict: false

options:
  language: C${filename.endsWith('.cc') ? '++' : ''}
  data_model: ILP32
  `
  fs.writeFileSync(path, content, { flag: 'a' });
}

fs.readdir(folder, (_, files) => {
  for (const file of files) {
    if (file.endsWith('.c') || file.endsWith('.cc')) {
      const ymlFileName = file.split('.').slice(0, -1).join('.') + '.yml';
      createFile(path.resolve(__dirname, 'realworld_simplified', ymlFileName), file);
    }
  }
})
