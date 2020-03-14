class AddLanguageCodeToLanguage < ActiveRecord::Migration[4.2]
  def change
    add_column :languages, :language_code, :string
  end
end
