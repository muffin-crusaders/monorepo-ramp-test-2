const path = require('path');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const TerserJSPlugin = require('terser-webpack-plugin');

module.exports = (env, argv) => ({
    mode: argv.mode,
    devtool: argv.mode === 'development' ? 'cheap-eval-source-map' : false,
    entry: './src/index.ts',
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'index.js',
        libraryTarget: 'commonjs2'
    },
    module: {
        rules: [
            {
                test: /\.s?[ac]ss$/,
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']
            },
            {
                test: /\.ts$/,
                use: 'ts-loader',
                exclude: /node_modules/
            },
            {
                test: /\.(png|svg)$/,
                use: 'url-loader'
            }
        ]
    },
    plugins: [new MiniCssExtractPlugin()],
    resolve: {
        // if multiple files share the same name but have different extensions, webpack will resolve the one with the extension listed first in the array and skip the rest.
        extensions: ['.ts', '.js', '.css', '.scss']
    },
    optimization: {
        // setting optimization.minimizer overrides the defaults provided by webpack, so make sure to also specify a JS minimizer
        // TerserJSPlugin is used by default, so we just reusing it
        minimizer: [new TerserJSPlugin({ extractComments: true }), new OptimizeCSSAssetsPlugin({})]
    }
});
