class AddPaperclipToInterview < ActiveRecord::Migration
  def change
    add_attachment :interviews, :zipfile
  end
end
