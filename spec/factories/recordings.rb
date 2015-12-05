FactoryGirl.define do
  factory :recording do |r|
    r.recorded '2015-09-28 17:33:32'
    r.interview { |a| a.association(:interview) }
    r.language { |a| a.association(:language) }
    r.phrase { |a| a.association(:phrase) }
  end
end
