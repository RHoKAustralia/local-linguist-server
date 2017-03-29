# Each Region within a Country is split into several Municipalities.
#
# @author Craig Read
class Municipality < ActiveRecord::Base
  belongs_to :region
  has_many :locales

  validates :name, presence: true
  validates :region_id, presence: true

  def full_name
    "#{region.name} - #{name}"
  end

  def to_s
    name
  end
end
