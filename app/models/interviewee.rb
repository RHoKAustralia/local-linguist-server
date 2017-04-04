# This represents a person being interviewed as part of a linguistics study.
#
# @author Craig Read
class Interviewee < ActiveRecord::Base
  belongs_to :locale
  has_many :interviews
  has_many :languages, through: :interviews

  validates :name, presence: true
  validates :gender, presence: true
  validates :occupation, presence: true
  validates :education_level, presence: true
  validates :age, presence: true
  validates :locale_id, presence: true
  validates :first_language, presence: true

  def to_s
    name
  end
end
