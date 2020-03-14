class RenameTextResponse < ActiveRecord::Migration[4.2]
  def change
    rename_column :recordings, :text_resposne, :text_response
  end
end
