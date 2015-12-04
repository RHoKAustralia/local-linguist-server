# Adding the audio to the recording
class AddPaperclipToRecording < ActiveRecord::Migration
  def change
    add_attachment :recordings, :audio
  end
end
