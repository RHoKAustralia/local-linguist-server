# This class represents the person performing an interview and
# taking recordings for a linguistics study.
#
# @author Craig Read
class Interviewer < ActiveRecord::Base
  has_many :interviews

  def to_s
    name
  end
end
