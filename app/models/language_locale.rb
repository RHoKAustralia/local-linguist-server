# A singly language will be spoken in several locales, but a single locale
# may also have several languages in use there.
#
# @author Craig Read
class LanguageLocale < ActiveRecord::Base
  belongs_to :language
  belongs_to :locale
end
