class Recording < ActiveRecord::Base
  belongs_to :interview
  belongs_to :language
  belongs_to :phrase
end
