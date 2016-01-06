class CreateSemesterCourses < ActiveRecord::Migration
  def change
    create_table :semester_courses do |t|
      t.integer :semester_id
      t.integer :course_id
      t.integer :prerequisite
      t.timestamps
    end
  end
end
