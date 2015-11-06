# A locale is equivalent to a town or village
#
# @author Craig Read
class Locale < ActiveRecord::Base
  belongs_to :municipality
  has_many :languages, through: :language_locale
  has_many :studies, through: :locale_study
  has_many :interviews

  def to_s
    name
  end
end
