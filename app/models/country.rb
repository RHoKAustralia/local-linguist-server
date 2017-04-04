# This represents a country where linguistics studies are taking place.
#
# @author Craig Read
class Country < ActiveRecord::Base
  has_many :regions
  validates :name, presence: true

  def to_s
    name
  end
end
