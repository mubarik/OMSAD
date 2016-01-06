class ModifySemesterCourses < ActiveRecord::Migration
  def up
    unless column_exists? :semester_courses , :faculty_member_id
      add_column :semester_courses , :faculty_member_id, :integer
    end
  end

  def down
    remove_column :semester_courses , :faculty_member_id
  end
end
