class Municipality < ActiveRecord::Base
  belongs_to :region
  has_many :locales
end
