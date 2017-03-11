# A locale is equivalent to a town or village
#
# @author Craig Read
class Locale < ActiveRecord::Base
  belongs_to :municipality
  has_many :interviews
  has_many :interviewees, through: :interviews
  has_many :languages, through: :interviews
  has_many :studies, through: :interviews

  def full_name
    "#{municipality.region.name} - #{municipality.name} - #{name}"
  end
  def to_s
    name
  end
end
