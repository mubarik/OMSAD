class ModifyConferencePublication < ActiveRecord::Migration
  def up
    add_column :conference_publications ,:rank_id,:integer
  end

  def down
    remove_column :conference_publications ,:rank_id,:integer
  end
end
