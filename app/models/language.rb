# This class represents a spoken and/or written language.
#
# @author Craig Read
class Language < ActiveRecord::Base
  def to_s
    name
  end
end
