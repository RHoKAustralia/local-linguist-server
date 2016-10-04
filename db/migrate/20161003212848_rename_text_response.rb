class RenameTextResponse < ActiveRecord::Migration
  def change
    rename_column :recordings, :text_resposne, :text_response
  end
end
