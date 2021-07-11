class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :title
      t.text :content
      t.text :url

      t.timestamps
    end
  end
end
