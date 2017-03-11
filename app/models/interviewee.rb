# This represents a person being interviewed as part of a linguistics study.
#
# @author Craig Read
class Interviewee < ActiveRecord::Base
  belongs_to :locale
  has_many :interviews
  has_many :languages, through: :interviews

  def to_s
    name
  end
end
