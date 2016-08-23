class AddLanguageCodeToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :language_code, :string
  end
end
