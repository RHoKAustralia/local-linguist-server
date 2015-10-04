FactoryGirl.define do
  sequence :language_name do |n|
    "Language #{n}"
  end

  factory :language do
    name { generate(:language_name) }
  end
end
