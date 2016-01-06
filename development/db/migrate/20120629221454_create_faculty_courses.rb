class CreateFacultyCourses < ActiveRecord::Migration
  def change
    create_table :faculty_courses do |t|
      t.integer :semester_course_id
      t.integer :faculty_member_id
      t.integer :noofstudents
      t.float :contribution
      t.string :sharedstatus
      t.string :offering
      t.timestamps
    end
  end
end
