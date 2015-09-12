class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :english_text
      t.binary :audio
      t.binary :image

      t.timestamps null: false
    end
  end
end
