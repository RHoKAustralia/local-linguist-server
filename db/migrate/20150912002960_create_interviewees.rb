class CreateInterviewees < ActiveRecord::Migration
  def change
    create_table :interviewees do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :gender
      t.string :occupation
      t.string :education_level
      t.integer :age

      t.timestamps null: false
    end
  end
end
