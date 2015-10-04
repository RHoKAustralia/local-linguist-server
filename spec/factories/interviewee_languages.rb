FactoryGirl.define do
  factory :interviewee_language do |il|
    il.primary_language false
    il.language { |a| a.association(:language) }
    il.interviewee { |a| a.association(:interviewee) }
  end
end
