# Each study is associated with 1 language
#
# @author Craig Read
class Study < ActiveRecord::Base
  belongs_to :language
  has_many :phrases, through: :phrase_study
  has_many :locales, through: :locale_study

  def to_s
    name
  end
end
