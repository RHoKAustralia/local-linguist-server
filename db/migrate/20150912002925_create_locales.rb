class CreateLocales < ActiveRecord::Migration[4.2]
  def change
    create_table :locales do |t|
      t.string :name
      t.references :municipality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
