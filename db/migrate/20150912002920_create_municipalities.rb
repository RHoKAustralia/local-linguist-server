class CreateMunicipalities < ActiveRecord::Migration[4.2]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
