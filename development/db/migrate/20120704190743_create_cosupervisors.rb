class CreateCosupervisors < ActiveRecord::Migration
  def change
    create_table :cosupervisors do |t|
      t.integer :ms_course_id
      t.integer :milestone_id
      t.integer :faculty_member_id
      t.boolean :affiliationwithlums
      t.string :cosupervisorname
      t.string :email
      t.string :designation
      t.timestamps
    end
  end
end
