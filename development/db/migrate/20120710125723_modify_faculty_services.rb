class ModifyFacultyServices < ActiveRecord::Migration
  def up

    add_column :faculty_member_services, :year , :string
  end

  def down
    remove_column :faculty_member_services, :year
  end
end
