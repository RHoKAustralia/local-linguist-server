# This represents a person being interviewed as part of a linguistics study.
#
# @author Craig Read
class Interviewee < ActiveRecord::Base
  def to_s
    name
  end
end
