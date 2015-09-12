class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.binary :audio
      t.datetime :recorded
      t.references :interview, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
