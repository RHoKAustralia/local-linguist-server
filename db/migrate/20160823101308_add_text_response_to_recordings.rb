class AddTextResponseToRecordings < ActiveRecord::Migration[4.2]
  def change
    add_column :recordings, :text_resposne, :string
  end
end
