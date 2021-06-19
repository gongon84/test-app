class TranslationController < ApplicationController
  require 'natto'

  def index
    text = 'ななみちゃんは今何してるの？
    おじさんはななみちゃんとのデートの事を考えてるよ！
    ダメだなしっかりしろ、俺'
    nm = Natto::MeCab.new
    @text = []
    tem = ""

    # テスト用
    @text_origin = []
    @part = []


    nm.parse(text) do |n|
      # 判定
      if n.feature.first(10).include?('係助詞')
        @text.push("#{n.surface}、")
        tem = '読点'
      # elsif n.feature.first(10).include?('終助詞')
      #   @text.push("#{n.surface}、")
      elsif n.feature.first(10).include?('読点')
        if tem == '読点'
          puts "if"
          tem = 0
        else
          @text.push(n.surface)
          tem = '読点'
        end
      else
        @text.push(n.surface)
        tem = 0
      end

      # テスト用
      @text_origin.push(n.surface) # 元の文章
      @part.push(n.feature) # 形態素解析の文章

      # @text.push("#{n.surface}\t#{n.feature}")
    end
  end
end
