FactoryGirl.define do
  factory :interview do |i|
    i.interview_time '2015-09-28 17:29:15'
    i.study { |a| a.association(:study) }
    i.interviewer { |a| a.association(:interviewer) }
    i.interviewee { |a| a.association(:interviewee) }
    i.locale { |a| a.association(:locale) }
  end
end
