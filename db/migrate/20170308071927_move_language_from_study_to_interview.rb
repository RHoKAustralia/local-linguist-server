# Need to move the language relationship from
# the study to the interview level
#
# @author Craig Read
class MoveLanguageFromStudyToInterview < ActiveRecord::Migration
  def up
    remove_column :studies, :language_id
    add_column :interviews, :language_id, :integer
  end

  def down
    add_column :studies, :language_id, :integer
    remove_column :interviews, :language_id
  end
end
