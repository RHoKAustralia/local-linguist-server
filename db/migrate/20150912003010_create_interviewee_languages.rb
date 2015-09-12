class CreateIntervieweeLanguages < ActiveRecord::Migration
  def change
    create_table :interviewee_languages do |t|
      t.boolean :primary_language
      t.references :language, index: true, foreign_key: true
      t.references :interviewee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
