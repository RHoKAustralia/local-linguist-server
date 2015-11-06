# This class represents a spoken and/or written language.
#
# @author Craig Read
class Language < ActiveRecord::Base
  has_many :locales, through: :language_locale
  has_many :interviewees, through: :interviewee_language
  has_many :recordings

  def to_s
    name
  end
end
