const copy = require("copy-dir");
const copyFunc = function() {
  console.log("copying to content folder");
  copy("build", "../Content", () => null); // Current Working Directory is where package.json is NOT the scripts folder
};
module.exports = copyFunc;
