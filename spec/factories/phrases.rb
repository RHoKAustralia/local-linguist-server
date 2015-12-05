FactoryGirl.define do
  sequence :phrase_text do |n|
    "English Text #{n}"
  end
  sequence :audio_url do |n|
    "/phrases/#{n}/audio"
  end
  sequence :image_url do |n|
    "/phrases/#{n}/image"
  end

  factory :phrase do |p|
    p.english_text { generate(:phrase_text) }
    p.audio_url { generate(:audio_url) }
    p.image_url { generate(:image_url) }
  end
end
