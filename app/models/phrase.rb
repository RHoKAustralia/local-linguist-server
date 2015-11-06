# We are studying many phrase as part of a linguistics study.
# e.g. The quick brown fox jumped over the sleeping dog.
#
# @author Craig Read
class Phrase < ActiveRecord::Base
  has_many :recordings
  has_many :studies, through: :phrase_study

  def to_s
    english_text
  end
end
