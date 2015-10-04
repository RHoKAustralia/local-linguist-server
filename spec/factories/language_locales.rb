FactoryGirl.define do
  factory :language_locale do |ll|
    ll.primary_language false
    ll.language { |a| a.association(:language) }
    ll.locale { |a| a.association(:locale) }
  end
end
