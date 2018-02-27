# Each study is associated with 1 language
#
# @author Craig Read
class Study < ApplicationRecord
  has_many :phrases
  has_many :interviews
  has_many :interviewees, through: :interviews
  has_many :interviewers, through: :interviews
  has_many :locales, through: :interviews

  accepts_nested_attributes_for :phrases, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
