FactoryGirl.define do
  sequence :recorded_time do |n|
    DateTime.parse('2017-03-01 17:33:00') + n.seconds
  end

  factory :recording do |r|
    r.recorded { generate(:recorded_time) }
    r.interview { |a| a.association(:interview) }
    r.phrase { |a| a.association(:phrase) }
  end
end
