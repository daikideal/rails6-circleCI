const { environment } = require('@rails/webpacker')

// bootstrapが使用するライブラリ(jQuery, Popper.js)を定義
const webpack = require('webpack')
environment.plugins.append(
  'Provide', 
  new webpack.ProvidePlugin({
    $: 'jquery', 
    jQuery: 'jquery', 
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
