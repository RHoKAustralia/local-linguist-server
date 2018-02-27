# This class represents a spoken and/or written language.
#
# @author Craig Read
class Language < ApplicationRecord
  has_many :interviews
  has_many :locales, through: :interviews
  has_many :interviewees, through: :interviews
  has_many :recordings

  validates :name, presence: true

  def to_s
    name
  end
end
