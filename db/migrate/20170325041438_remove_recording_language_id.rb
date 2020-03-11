class RemoveRecordingLanguageId < ActiveRecord::Migration[4.2]
  def change
    remove_column :recordings, :language_id
  end
end
