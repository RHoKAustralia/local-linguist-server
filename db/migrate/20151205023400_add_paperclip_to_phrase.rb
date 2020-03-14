class AddPaperclipToPhrase < ActiveRecord::Migration[4.2]
  def change
    add_attachment :phrases, :audio
    add_attachment :phrases, :image
  end
end
