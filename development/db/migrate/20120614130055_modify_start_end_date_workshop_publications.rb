class ModifyStartEndDateWorkshopPublications < ActiveRecord::Migration
  def up
    change_column :workshop_publications ,:workshopstartdate,:date
    change_column :workshop_publications ,:workshopenddate,:date
  end

  def down
    change_column :workshop_publications ,:workshopstartdate,:datetime
    change_column :workshop_publications ,:workshopenddate,:datetime
  end
end
