# As part of an interview, recordings may be made for
# particular phrases within a language.
#
# @author Craig Read
class Recording < ActiveRecord::Base
  belongs_to :interview
  belongs_to :language
  belongs_to :phrase
end
