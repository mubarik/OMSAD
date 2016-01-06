class ModifyWorkshopPublications < ActiveRecord::Migration
  def up
     remove_column :workshop_publications , :acceptancedate
  end

  def down
    add_column     :workshop_publications , :acceptancedate ,:datetime
  end
end
