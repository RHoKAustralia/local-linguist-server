FactoryGirl.define do
  sequence :phrase_text do |n|
    "English Text #{n}"
  end

  factory :phrase do |p|
    p.english_text { generate(:phrase_text) }
  end
end
