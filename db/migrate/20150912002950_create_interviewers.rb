class CreateInterviewers < ActiveRecord::Migration[4.2]
  def change
    create_table :interviewers do |t|
      t.string :name
      t.string :mobile
      t.string :device_id
      t.string :email

      t.timestamps null: false
    end
  end
end
