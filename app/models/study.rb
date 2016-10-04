# Each study is associated with 1 language
#
# @author Craig Read
class Study < ActiveRecord::Base
  belongs_to :language
  has_many :phrase_studies, dependent: :delete_all
  has_many :locale_studies, dependent: :delete_all
  has_many :phrases, through: :phrase_studies, dependent: :delete_all
  has_many :locales, through: :locale_studies, dependent: :delete_all

  accepts_nested_attributes_for :phrases, allow_destroy: true
  accepts_nested_attributes_for :locales

  # TODO: Move language relationship to the interview

  def to_s
    name
  end
end
