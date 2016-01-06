class ModifyResearchAssistant < ActiveRecord::Migration
  def up
    add_column :research_assistants, :faculty_member_id , :integer
    add_column :research_assistants, :research_grant_id , :integer
    change_column :research_assistants, :description , :text
  end

  def down
    change_column :research_assistants, :description
  end
end
