FactoryGirl.define do
  sequence :phrase_text do |n|
    "English Text #{n}"
  end
  sequence :audio do |n|
    "Audio #{n}"
  end
  sequence :image do |n|
    "Image #{n}"
  end

  factory :phrase do |p|
    p.english_text { generate(:phrase_text) }
    p.audio { generate(:audio) }
    p.image { generate(:image) }
  end
end
