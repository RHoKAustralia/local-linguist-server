class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name
      t.date :start_date
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
