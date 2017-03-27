# This class represents the person performing an interview and
# taking recordings for a linguistics study.
#
# @author Craig Read
class Interviewer < ActiveRecord::Base
  has_many :interviews

  validates :name, presence: true
  validates :mobile, presence: true
  validates :device_id, presence: true
  validates :email, presence: true

  def to_s
    name
  end
end
