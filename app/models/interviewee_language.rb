# This class represents a link between interviewees and their spoken languages.
#
# @author Craig Read
class IntervieweeLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :interviewee
end
