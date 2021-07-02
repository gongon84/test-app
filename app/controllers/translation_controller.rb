class TranslationController < ApplicationController
  
  require 'natto'
  require "open-uri" #webに接続するためのライブラリ
  require "nokogiri" #クレイピングに使用するライブラリ

  def index
    text = 'ななみちゃんは、今何してるの？
    おじさんはななみちゃんとのデートの事を考えてるよ！
    ダメだなしっかりしろ、俺'
    nm = Natto::MeCab.new
    @text = []
    array = ["ぴえん", "えぐいって", "全集中の呼吸", "淡色系女子", "あっ…察し", "パクツイ", "３１５０", "パリピ", "かまちょ", "ぱおん", "すきぴ",
    "ジワる",  "エゴサ", "ワッショイ", "きゅんです", "エモい", "ぽよ", "エチエチ", "ンゴ", "すこ", "きゅんきゅん", "よき", "しごおわ", "ふぁぼ",
    "らぶりつ"]
    tem = ""

    # テスト用
    @text_origin = []
    @part = []

    nm.parse(text) do |n|
      # 判定
      if n.feature.first(10).include?('係助詞')
        @text.push("#{n.surface}、")
        tem = '読点'
      elsif n.feature.first(10).include?('読点')
        if tem == '読点'
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
    end
  end

  def key
  end
end
