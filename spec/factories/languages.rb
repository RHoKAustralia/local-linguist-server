FactoryBot.define do
  sequence :language_name do |n|
    "Language #{n}"
  end
  sequence :language_code do |n|
    "#{n}"
  end

  factory :language do
    name { generate(:language_name) }
    language_code { generate(:language_code) }
  end
end
