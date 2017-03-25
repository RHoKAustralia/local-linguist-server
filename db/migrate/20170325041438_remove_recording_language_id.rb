class RemoveRecordingLanguageId < ActiveRecord::Migration
  def change
    remove_column :recordings, :language_id
  end
end
