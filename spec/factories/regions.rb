FactoryGirl.define do
  sequence :region_name do |n|
    "Region #{n}"
  end

  factory :region do |r|
    r.name { generate(:region_name) }
    r.country { |a| a.association(:country) }
  end
end
