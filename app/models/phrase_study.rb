class PhraseStudy < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :study
end
