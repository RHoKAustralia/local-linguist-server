class CreateRegions < ActiveRecord::Migration[4.2]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
