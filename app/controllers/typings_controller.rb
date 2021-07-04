class TypingsController < ApplicationController
  require 'romkan' # ひらがな　=> ローマ字
  require 'mechanize' # スクレイピング

  def index
    @problem_ja = []
    @problem_ro = []

    @typing_words = Typing.all
    @typing_words.each do |words|
      @problem_ja.push(words.word)
      @problem_ro.push(words.to_hiragana.to_roma)
    end
    @rand = rand(@problem_ja.length)

    # railsの変数をjsへ
    gon.problem_ja = @problem_ja
    gon.problem_ro = @problem_ro
  end
end
