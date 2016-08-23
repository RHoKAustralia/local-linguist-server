class AddTextResponseToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :text_resposne, :string
  end
end
