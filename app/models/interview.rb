class Interview < ActiveRecord::Base
  belongs_to :study
  belongs_to :interviewer
  belongs_to :interviewee
  belongs_to :locale
end
