class CreateFacultyMembers < ActiveRecord::Migration
  def change
    create_table :faculty_members do |t|
      t.integer :user_id
      t.string :designation
      t.text :biography
      t.text :awardsinfo
      t.text :academicrecords
      t.text :researchinterests
      t.text :jobexperiences
      t.timestamps
    end
  end
end
