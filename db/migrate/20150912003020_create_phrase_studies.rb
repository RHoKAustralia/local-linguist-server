class CreatePhraseStudies < ActiveRecord::Migration
  def change
    create_table :phrase_studies do |t|
      t.references :phrase, index: true, foreign_key: true
      t.references :study, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
