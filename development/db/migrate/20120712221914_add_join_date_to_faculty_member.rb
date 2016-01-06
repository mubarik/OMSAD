class AddJoinDateToFacultyMember < ActiveRecord::Migration
  def up
    add_column :faculty_members,:joiningdate,:date
  end
  def down
    remove_column :faculty_members,:joiningdate
  end
end
