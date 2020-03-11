class AddResponseTypeToPhrase < ActiveRecord::Migration[4.2]
  def change
    add_column :phrases, :response_type_id, :integer
  end
end
