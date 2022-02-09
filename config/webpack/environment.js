const { environment } = require('@rails/webpacker')

module.exports = environment

// 20220209以下追記
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',

    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)