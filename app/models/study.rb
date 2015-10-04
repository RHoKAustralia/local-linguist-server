# Each study is associated with 1 language
#
# @author Craig Read
class Study < ActiveRecord::Base
  belongs_to :language

  def to_s
    name
  end
end
