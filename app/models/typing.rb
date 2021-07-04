class Typing < ApplicationRecord
    # 漢字変換
    # 参考 => https://qiita.com/Naggi-Goishi/items/e9f8753e88bc9f0b67b5
    def to_hiragana()
        begin
          # pタグの部分を抽出
          Mechanize.new.get('https://yomikatawa.com/kanji/' + self.word).search('#content p').first.inner_text
        rescue => exception
          # 漢字ではなかった場合、そのまま返す
          return self.word
        end
    end
end
