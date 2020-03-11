class AddStudyIdToPhrases < ActiveRecord::Migration[4.2]
  def change
    add_column :phrases, :study_id, :integer
  end
end
