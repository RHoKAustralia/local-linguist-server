# Adding the audio to the recording
class AddPaperclipToRecording < ActiveRecord::Migration[4.2]
  def change
    add_attachment :recordings, :audio
  end
end
