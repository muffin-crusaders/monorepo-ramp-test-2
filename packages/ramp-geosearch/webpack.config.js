const path = require('path');

module.exports = (env, argv) => ({
    mode: argv.mode,
    devtool: argv.mode === 'development' ? 'cheap-eval-source-map' : false,
    entry: './src/index.ts',

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'index.js',
        // NOTE: [monoRAMP] since this plugin is bundled directly into the RAMP core, it needs to be packaged as cjs module
        libraryTarget: 'commonjs2'
    },

    module: {
        rules: [
            {
                test: /\.ts$/,
                enforce: 'pre',
                use: [
                    {
                        loader: 'ts-loader'
                    },
                    'tslint-loader'
                ],
                exclude: /node_modules/
            }
        ]
    },

    resolve: {
        extensions: ['.ts', '.js']
    }
});
