const copy = require("./copyBuildFolder");
process.env.NODE_ENV = "development";

const fs = require("fs-extra");
const paths = require("react-scripts-ts/config/paths");
const webpack = require("webpack");
const config = require("react-scripts-ts/config/webpack.config.dev.js");

// removes react-dev-utils/webpackHotDevClient.js at first in the array
config.entry = config.entry.filter(
  entry => !entry.includes("webpackHotDevClient")
);

console.log(process.env.PUBLIC_URL);
config.output.path = paths.appBuild;
config.output.publicPath = "https://localhost:44302/Content";

webpack(config).watch({}, (err, stats) => {
  if (err) {
    console.error(err);
  } else {
    copyPublicFolder();
  }
  console.error(
    stats.toString({
      chunks: false,
      colors: true
    })
  );
});

console.log(paths.appPublic, paths.appBuild);

function copyPublicFolder() {
  fs.copySync(paths.appPublic, paths.appBuild, {
    dereference: true,
    filter: file => file !== paths.appHtml
  });
  copy();
}
