# We are studying many phrase as part of a linguistics study.
# e.g. The quick brown fox jumped over the sleeping dog.
#
# @author Craig Read
class Phrase < ActiveRecord::Base
  belongs_to :study
  has_many :interviews, through: :study
  has_many :recordings, dependent: :destroy

  TYPE_TEXT = 1
  TYPE_AUDIO = 2
  TYPE_TEXT_AUDIO = 3

  UPLOAD_PATH = ':rails_root/public/assets/:class/:id/:style/:basename.:extension'
  URL = '/assets/:class/:id/:style/:basename.:extension'
  DEFAULT_URL = '/assets/missing.png'

  has_attached_file :image, url: URL, path: UPLOAD_PATH, default_url: DEFAULT_URL
  has_attached_file :audio, url: URL, path: UPLOAD_PATH, default_url: DEFAULT_URL

  validates :audio, attachment_content_type: {
              content_type: [
                'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3',
                'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio',
                'audio/x-m4a'
              ]
            }

  def string_choices=(value)
    choices_will_change!
    self.choices = value.split('|')
  end

  def string_choices
    choices.join('|')
  end

  def to_s
    english_text
  end
end
