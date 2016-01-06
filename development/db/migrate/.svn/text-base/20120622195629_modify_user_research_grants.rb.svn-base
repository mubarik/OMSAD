class ModifyUserResearchGrants < ActiveRecord::Migration
  def up
    remove_column :user_research_grants , :teammembername
    remove_column :user_research_grants , :lumsaffiliation
    remove_column :user_research_grants , :affiliation
  end

  def down
    add_column :user_research_grants, :teammembername, :string
    add_column :user_research_grants, :lumsaffiliation, :boolean
    add_column :user_research_grants, :affiliation, :string
  end
end
