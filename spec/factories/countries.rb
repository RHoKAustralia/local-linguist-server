FactoryGirl.define do
  sequence :country_name do |n|
    "Country #{n}"
  end

  factory :country do |c|
    c.name { generate(:country_name) }
  end
end
