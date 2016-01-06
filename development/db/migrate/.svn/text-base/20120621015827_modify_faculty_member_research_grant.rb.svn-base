class ModifyFacultyMemberResearchGrant < ActiveRecord::Migration
  def up
    add_column :faculty_member_research_grants , :copiname , :string
    add_column :faculty_member_research_grants,  :affiliationname , :string
    add_column :faculty_member_research_grants , :affiliationtype , :boolean
  end

  def down
    remove_column :faculty_member_research_grants , :copiname
    remove_column :faculty_member_research_grants,  :affiliationname
    remove_column :faculty_member_research_grants , :affiliationtype
  end
end
