class ModifySemesterCoursesRollback < ActiveRecord::Migration
  def up
    unless !column_exists? :semester_courses , :faculty_member_id
       remove_column :semester_courses , :faculty_member_id
    end
  end

  def down
    add_column :semester_courses , :faculty_member_id, :integer
  end
end
