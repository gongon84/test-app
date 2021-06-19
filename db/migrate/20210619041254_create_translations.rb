class CreateTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :translations do |t|
      t.string :word

      t.timestamps
    end
  end
end
