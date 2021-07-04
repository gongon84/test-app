class CreateTypings < ActiveRecord::Migration[6.1]
  def change
    create_table :typings do |t|
      t.string :word

      t.timestamps
    end
  end
end
