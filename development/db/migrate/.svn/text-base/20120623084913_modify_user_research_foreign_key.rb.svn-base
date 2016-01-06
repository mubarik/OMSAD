class ModifyUserResearchForeignKey < ActiveRecord::Migration
  def up
    rename_column :user_research_grants ,:researchgrant_id, :research_grant_id
  end

  def down
    rename_column :user_research_grants ,:research_grant_id,:researchgrant_id
  end
end
