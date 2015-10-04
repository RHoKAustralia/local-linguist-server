FactoryGirl.define do
  sequence :interviewer_name do |n|
    "Interviewer #{n}"
  end
  sequence :device_id do |n|
    "device_#{n}"
  end

  factory :interviewer do |i|
    i.name { generate(:interviewer_name) }
    i.mobile { generate(:mobile_number) }
    i.device_id { generate(:device_id) }
    i.email { generate(:email_address) }
  end
end
