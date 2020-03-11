class CreateInterviews < ActiveRecord::Migration[4.2]
  def change
    create_table :interviews do |t|
      t.datetime :interview_time
      t.references :study, index: true, foreign_key: true
      t.references :interviewer, index: true, foreign_key: true
      t.references :interviewee, index: true, foreign_key: true
      t.references :locale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
