FactoryGirl.define do
  sequence :study_name do |n|
    "Study #{n}"
  end

  factory :study do |s|
    s.name { generate(:study_name) }
    s.start_date '2015-09-28'
  end
end
