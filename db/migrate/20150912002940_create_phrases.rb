class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :english_text
      t.text :choices, array: true, default: []

      t.timestamps null: false
    end
  end
end
