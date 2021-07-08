const { environment } = require('@rails/webpacker')

// 追記 jquery
// 参考　→　https://qiita.com/iiyama_makoto/items/940b130fd20540fd70f1
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
// ここまで

module.exports = environment
