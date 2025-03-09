const path = require('path');
const fs = require('fs');

const giveFolderStats = (folder) => {
  fs.readdir(folder, (_, files) => {
    let cFiles = 0;
    let ccFiles = 0;
    for (const file of files) {
      if (file.endsWith('.c') ) {
        cFiles++;
      } else if (file.endsWith('.cc')) {
        ccFiles++;
      }
    }
    console.log(`Total test files in ${folder} is ${cFiles + ccFiles}. Out of them there is ${cFiles} of C tests and ${ccFiles} of C++ tests.`);
  })
}

giveFolderStats(path.resolve(__dirname, '..', 'realworld_simplified'));
giveFolderStats(path.resolve(__dirname, '..', 'sv-comp_tests'));
