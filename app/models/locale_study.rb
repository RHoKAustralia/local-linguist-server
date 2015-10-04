# A single study may be performed in several locales and a single locale
# may be involved in several language studies.
#
# @author Craig Read
class LocaleStudy < ActiveRecord::Base
  belongs_to :locale
  belongs_to :study
end
