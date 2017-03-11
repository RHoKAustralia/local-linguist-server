class AddStudyIdToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :study_id, :integer
  end
end
