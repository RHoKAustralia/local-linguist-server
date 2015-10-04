# This is a linking class between phrases and studies.
# A study can include many phrases, and a phrase can
# be used within many studies.
#
# @author Craig Read
class PhraseStudy < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :study
end
