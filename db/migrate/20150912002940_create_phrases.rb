class CreatePhrases < ActiveRecord::Migration[4.2]
  def change
    create_table :phrases do |t|
      t.string :english_text
      t.text :choices, array: true, default: []

      t.timestamps null: false
    end
  end
end
