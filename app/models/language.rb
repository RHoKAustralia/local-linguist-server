# This class represents a spoken and/or written language.
#
# @author Craig Read
class Language < ActiveRecord::Base
  has_many :interviews
  has_many :locales, through: :interviews
  has_many :interviewees, through: :interviews
  has_many :recordings

  def to_s
    name
  end
end
