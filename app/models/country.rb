# This represents a country where linguistics studies are taking place.
#
# @author Craig Read
class Country < ActiveRecord::Base
  def to_s
    name
  end
end
