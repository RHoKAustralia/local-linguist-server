class AddResponseTypeToPhrase < ActiveRecord::Migration
  def change
    add_column :phrases, :response_type_id, :integer
  end
end
