class ModifyStartEndDateResearchGrants < ActiveRecord::Migration
  def up
    change_column :research_grants ,:startdate ,:date
    change_column :research_grants ,:enddate ,:date
  end

  def down
    change_column :research_grants ,:startdate ,:datetime
    change_column :research_grants ,:enddate ,:datetime
  end
end
