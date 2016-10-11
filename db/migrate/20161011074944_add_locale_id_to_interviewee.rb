class AddLocaleIdToInterviewee < ActiveRecord::Migration
  def change
    add_column :interviewees, :locale_id, :integer
    add_column :interviewees, :lived_whole_life, :boolean
    add_column :interviewees, :first_language, :string
  end
end
