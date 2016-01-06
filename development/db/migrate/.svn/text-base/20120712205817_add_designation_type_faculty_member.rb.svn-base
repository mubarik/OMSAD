class AddDesignationTypeFacultyMember < ActiveRecord::Migration
  def up
    remove_column :faculty_members , :designation
    add_column    :faculty_members , :faculty_member_designation_type_id ,:integer,:default=>1
  end
  def down
    add_column :faculty_members , :designation , :string
    remove_column    :faculty_members , :faculty_member_designation_type_id
  end
end

#change_column :departments ,:school_id,:default=>1