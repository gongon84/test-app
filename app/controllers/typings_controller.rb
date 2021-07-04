class TypingsController < ApplicationController
  require 'romkan' # ひらがな　=> ローマ字
  require 'mechanize' # スクレイピング

  def index
    @problem_ja = []
    @problem_ro = []

    # データベースから単語を持ってくる
    @typing_words = Typing.all
    @typing_words.each do |words|
      @problem_ja.push(words.word) # 日本語を追加
      @problem_ro.push(words.to_hiragana.to_roma) # ローマ字を追加
    end
    @rand = rand(@problem_ja.length)

    # railsの変数をjsでも使用可能にする
    gon.problem_ja = @problem_ja
    gon.problem_ro = @problem_ro
  end
end
