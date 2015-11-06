# A country is divided into many regions
#
# @author Craig Read
class Region < ActiveRecord::Base
  belongs_to :country
  has_many :municipalities

  delegate :name, to: :country, prefix: :country, allow_nil: true

  def to_s
    name
  end
end
