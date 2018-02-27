require 'zip'

# This represents an interview taken as part of a linguistics study at
# a particular locale.
#
# @author Craig Read
class Interview < ApplicationRecord
  belongs_to :study
  belongs_to :language
  belongs_to :interviewer
  belongs_to :interviewee
  belongs_to :locale
  has_many :phrases, through: :study
  has_many :recordings, dependent: :delete_all

  has_attached_file :zipfile,
                    url: '/assets/:class/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/:class/:id/:style/:basename.:extension',
                    default_url: '/assets/missing.png'

  validates :study_id, presence: true
  validates :interviewer_id, presence: true
  validates :interviewee_id, presence: true
  validates :language_id, presence: true

  validates_attachment :zipfile, presence: true,
                       content_type: { content_type: "application/zip" },
                       size: { in: 0..8192.kilobytes }

  delegate :name, to: :study, prefix: :study, allow_nil: true
  delegate :name, to: :language, prefix: :language, allow_nil: true
  delegate :name, to: :interviewer, prefix: :interviewer, allow_nil: true
  delegate :name, to: :interviewee, prefix: :interviewee, allow_nil: true
  delegate :name, to: :locale, prefix: :locale, allow_nil: true

  def to_s
    "#{study_name}, #{locale_name}, #{interview_time}"
  end
end
