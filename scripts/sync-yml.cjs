const path = require('path');
const fs = require('fs');

const folderSvComp = path.resolve(__dirname, '..', 'sv-comp_tests');
const folderRealWorld = path.resolve(__dirname, '..', 'realworld_simplified');

fs.readdir(folderSvComp, (_, files) => {
  for (const file of files) {
    if (file.endsWith('.c')) {
      const ymlFileName = file.split('.').slice(0, -1).join('.') + '.yml';
      const oldYmlFilePath = path.resolve(folderSvComp, ymlFileName);
      const updatedYmlFilePath = path.resolve(folderRealWorld, ymlFileName);
      if (fs.existsSync(oldYmlFilePath)) fs.unlinkSync(oldYmlFilePath)
      fs.copyFileSync(updatedYmlFilePath, oldYmlFilePath)
      // console.log(`${updatedYmlFilePath} -> ${oldYmlFilePath}`);
    }
  }
})
