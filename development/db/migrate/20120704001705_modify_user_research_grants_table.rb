class ModifyUserResearchGrantsTable < ActiveRecord::Migration
  def up

    add_column :user_research_grants, :teamstartdate, :string
    add_column :user_research_grants, :teamenddate, :string
  end

  def down

    remove_column :user_research_grants, :teamstartdate
    remove_column :user_research_grants, :teamenddate
  end
end
