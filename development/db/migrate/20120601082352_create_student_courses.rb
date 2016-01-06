class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :semester_id
      t.float :coursegpa
      t.string :coursegrade
      t.string  :coursestatus
      t.timestamps
    end
  end
end
