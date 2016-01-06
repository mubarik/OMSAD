class ModifyFacultyCourses < ActiveRecord::Migration
  def up
     remove_column :faculty_courses, :semester_course_id
     add_column :faculty_courses ,:semester_id, :integer
     add_column :faculty_courses , :course_id, :integer

  end

  def down
     add_column :faculty_courses, :semester_course_id
     remove_column :faculty_courses ,:semester_id
     remove_column :faculty_courses , :course_id
  end
end
