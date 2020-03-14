class AddPaperclipToInterview < ActiveRecord::Migration[4.2]
  def change
    add_attachment :interviews, :zipfile
  end
end
