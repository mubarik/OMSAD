class AddGradeTypeToStudentCourses < ActiveRecord::Migration
  def up
    add_column :student_courses ,:grade_type_id,:integer,:default=>1
    remove_column :student_courses,:coursegrade
  end

  def down
    remove_column :student_courses ,:grade_type_id
    add_column :student_courses,:coursegrade,:string
  end
end
