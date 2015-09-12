class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :english_text
      t.binary :image
      t.references :study, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
