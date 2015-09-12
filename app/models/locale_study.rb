class LocaleStudy < ActiveRecord::Base
  belongs_to :locale
  belongs_to :study
end
