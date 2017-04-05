FactoryGirl.define do
  sequence :phrase_text do |n|
    "English Text #{n}"
  end
  sequence :prompt_text do |n|
    "Prompt #{n}"
  end

  factory :phrase do |p|
    p.english_text { generate(:phrase_text) }
    p.prompt { generate(:prompt_text) }
    p.study { |a| a.association(:study) }
    p.response_type_id 1
  end
end
