class CreateFacultyMemberCollaborators < ActiveRecord::Migration
  def change
    create_table :faculty_member_collaborators do |t|
       t.string :name
       t.string :affiliation
       t.string :description
       t.date :startdate
       t.date :enddate
       t.integer :faculty_member_id
      t.timestamps
    end
  end
end
