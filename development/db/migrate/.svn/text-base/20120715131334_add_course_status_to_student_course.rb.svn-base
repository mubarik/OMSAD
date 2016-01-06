class AddCourseStatusToStudentCourse < ActiveRecord::Migration
  def up
    add_column :student_courses ,:course_status_id,:integer,:default=>1
    remove_column :student_courses,:coursestatus
  end

  def down
    remove_column :student_courses ,:course_status_id
    add_column :student_courses,:coursestatus,:string
  end
end
