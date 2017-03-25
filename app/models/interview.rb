require 'zip'

# This represents an interview taken as part of a linguistics study at
# a particular locale.
#
# @author Craig Read
class Interview < ActiveRecord::Base
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

  validates :zipfile, attachment_content_type:
                        { content_type: ['application/zip'] }

  delegate :name, to: :study, prefix: :study, nil: true
  delegate :name, to: :language, prefix: :language, nil: true
  delegate :name, to: :interviewer, prefix: :interviewer, nil: true
  delegate :name, to: :interviewee, prefix: :interviewee, nil: true
  delegate :name, to: :locale, prefix: :locale, nil: true

  def to_s
    "#{study_name}, #{locale_name}, #{interview_time}"
  end
end
