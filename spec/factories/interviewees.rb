FactoryGirl.define do
  sequence :interviewee_name do |n|
    "Interviewee #{n}"
  end
  sequence :mobile_number do |n|
    "0400000#{n}"
  end
  sequence :email_address do |n|
    "person#{n}@example.com"
  end

  factory :interviewee do |i|
    i.name { generate(:interviewee_name) }
    i.email  { generate(:email_address) }
    i.gender 'Female'
    i.occupation 'Farmer'
    i.education_level 'High School'
    i.age 35
    i.locale { |a| a.association(:locale) }
    i.first_language 'Tetum'
  end
end
