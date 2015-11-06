# This represents a person being interviewed as part of a linguistics study.
#
# @author Craig Read
class Interviewee < ActiveRecord::Base
  has_many :languages, through: :interviewee_language
  has_many :interviews

  def to_s
    name
  end
end
