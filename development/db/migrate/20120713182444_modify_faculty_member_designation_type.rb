class ModifyFacultyMemberDesignationType < ActiveRecord::Migration
  def up
    add_column :faculty_member_designation_types ,:project_conf_id,:integer
  end

  def down
    remove_column :faculty_member_designation_types ,:project_conf_id
  end
end
