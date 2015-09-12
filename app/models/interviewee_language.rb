class IntervieweeLanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :interviewee
end
