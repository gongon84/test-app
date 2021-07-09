# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

### 追記　rails起動時読まれる
# 日本語版Wikipediaを設定
require 'Wikipedia'
Wikipedia.find(".")
Wikipedia.configure {
  domain 'ja.wikipedia.org'
  path   'w/api.php'
}
### ここまで

run Rails.application
Rails.application.load_server
