FactoryGirl.define do
  factory :phrase_study do |ps|
    ps.phrase { |a| a.association(:phrase) }
    ps.study { |a| a.association(:study) }
  end
end
