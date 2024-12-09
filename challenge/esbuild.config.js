const { svgPlugin } = require("esbuild-plugin-svg");

module.exports = {
  entryPoints: ["src/index.js"], // Adjust the entry point as needed
  bundle: true,
  outfile: "dist/bundle.js", // Adjust the output file path as needed
  plugins: [svgPlugin()],
};
