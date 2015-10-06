# Each Region within a Country is split into several Municipalities.
#
# @author Craig Read
class Municipality < ActiveRecord::Base
  belongs_to :region

  def to_s
    name
  end
end
