# As part of an interview, recordings may be made for
# particular phrases within a language.
#
# @author Craig Read
class Recording < ApplicationRecord
  belongs_to :interview
  belongs_to :phrase

  validates :interview_id, presence: true
  validates :phrase_id, presence: true

  has_attached_file :audio,
                    url: '/assets/:class/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/:class/:id/:style/:basename.:extension',
                    default_url: '/assets/missing.png'

  # TODO: Record text responses

  validates :audio, attachment_content_type: {
              content_type: [
                'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3',
                'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio',
                'audio/x-m4a', 'video/mp4'
              ]
            }
end
