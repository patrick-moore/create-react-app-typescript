const fs = require("fs");
const path = require("path");

if (process.platform == "win32") {
  fs.copyFileSync(
    path.join(process.env.HOMEDRIVE, ".npmrc"),
    path.join(process.env.USERPROFILE, ".npmrc")
  );
  console.log(".npmrc was copied to home directory");
}
