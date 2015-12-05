# We are studying many phrase as part of a linguistics study.
# e.g. The quick brown fox jumped over the sleeping dog.
#
# @author Craig Read
class Phrase < ActiveRecord::Base
  has_many :recordings
  has_many :studies, through: :phrase_study

  has_attached_file :image
  has_attached_file \
    :audio,
    url: '/phrases/:class/:id/:attachment/:style.:extension',
    path: ':rails_root/public/assets/:class/:id/:attachment/:style.:extension'

  validates :audio, attachment_content_type: {
    content_type: [
      'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3',
      'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'
    ]
  }

  def to_s
    english_text
  end
end
