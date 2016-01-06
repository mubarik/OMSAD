class ModifyUserResearchGrantsDate < ActiveRecord::Migration
  def up
    change_column :user_research_grants, :teamstartdate, :date
    change_column :user_research_grants, :teamenddate, :date
  end

  def down
    change_column :user_research_grants, :teamstartdate
    change_column :user_research_grants, :teamenddate
  end
end
