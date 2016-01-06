class CreateCollaboratorResearchGrants < ActiveRecord::Migration
  def change
    create_table :collaborator_research_grants do |t|
      t.integer :faculty_member_id
      t.integer :research_grant_id
      t.string   :collaboratorname
      t.string   :affiliationname
      t.string   :affiliationtype
      t.timestamps
    end
  end
end
