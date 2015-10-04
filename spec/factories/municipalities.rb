FactoryGirl.define do
  sequence :municipality_name do |n|
    "Municipality #{n}"
  end

  factory :municipality do |m|
    m.name { generate(:municipality_name) }
    m.region { |a| a.association(:region) }
  end
end
