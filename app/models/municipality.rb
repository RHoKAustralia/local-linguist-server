# Each Region within a Country is split into several Municipalities.
#
# @author Craig Read
class Municipality < ActiveRecord::Base
  belongs_to :region
  has_many :locales

  def full_name
    "#{region.name} - #{name}"
  end

  def to_s
    name
  end
end
