# As part of an interview, recordings may be made for
# particular phrases within a language.
#
# @author Craig Read
class Recording < ActiveRecord::Base
  belongs_to :interview
  belongs_to :language
  belongs_to :phrase

  has_attached_file :audio, path: File.join(Rails.root, 'public/system/:class/:attachment/:basename.:extension'), default_url: ''

  # TODO: Record text responses

  validates :audio, attachment_content_type: {
    content_type: [
      'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3',
      'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio',
      'audio/x-m4a'
    ]
  }
end
