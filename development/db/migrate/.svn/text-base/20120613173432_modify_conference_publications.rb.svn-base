class ModifyConferencePublications < ActiveRecord::Migration
  def up
      remove_column :conference_publications , :acceptancedate
      add_column    :conference_publications , :acceptancerate ,:integer
  end

  def down
      add_column :conference_publications , :acceptancedate ,:datetime
      remove_column :conference_publications ,:acceptancerate
  end
end
