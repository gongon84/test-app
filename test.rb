require 'natto'
require "open-uri" #webに接続するためのライブラリ
require "nokogiri" #クレイピングに使用するライブラリ

# スクレイピング
# url = "https://jikitourai.net/schoolgirl-use-expression"
#取得するhtml用charset
# charset = nil

# html = open(url) do |page|
#   #charsetを自動で読み込み、取得
#   charset = page.charset
#   #中身を読む
#   page.read
# end
 
# Nokogiri で切り分け
# contents = Nokogiri::HTML.parse(html,nil,charset)
# test = []
# text = ""
# contents.css('h3').each do |link|
#     test.push(link.content)
# end
# p test[0..60]

# p "文字を入力してね！"
# input = gets.to_s
# text << test[rand(test.length)]
# text << "が流行ってるらしいネ"
# p text
# puts contents.title

p "文字を入力してね！"
input = gets.to_s
text = ""
array = ["ぴえん", "えぐいって", "全集中の呼吸", "淡色系女子", "あっ…察し", "パクツイ", "３１５０", "パリピ", "かまちょ", "ぱおん", "すきぴ",
    "ジワる",  "エゴサ", "ワッショイ", "きゅんです", "エモい", "ぽよ", "エチエチ", "ンゴ", "すこ", "きゅんきゅん", "よき", "しごおわ", "ふぁぼ",
    "らぶりつ"]
text << array[rand(array.length)]
text << 