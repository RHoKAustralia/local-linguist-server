FactoryBot.define do
  sequence :locale_name do |n|
    "Locale #{n}"
  end

  factory :locale do |l|
    l.name { generate(:locale_name) }
    l.municipality { |a| a.association(:municipality) }
  end
end
