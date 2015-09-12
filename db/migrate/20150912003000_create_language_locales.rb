class CreateLanguageLocales < ActiveRecord::Migration
  def change
    create_table :language_locales do |t|
      t.boolean :primary_language
      t.references :language, index: true, foreign_key: true
      t.references :locale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
