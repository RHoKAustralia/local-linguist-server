class AddPaperclipToPhrase < ActiveRecord::Migration
  def change
    add_attachment :phrases, :audio
    add_attachment :phrases, :image
  end
end
