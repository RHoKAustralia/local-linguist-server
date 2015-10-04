class Locale < ActiveRecord::Base
  belongs_to :municipality

  def to_s
    name
  end
end
