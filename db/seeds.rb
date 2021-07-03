typing_words = ["日本語", "英語", "フランス語", "すいか", "おはよう", "読書"]

typing_words.length.times do |i|
    Translation.create!(
        word: typing_words[i]
    )
end