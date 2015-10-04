FactoryGirl.define do
  factory :locale_study do |ls|
    ls.completed false
    ls.locale { |a| a.association(:locale) }
    ls.study { |a| a.association(:study) }
  end
end
