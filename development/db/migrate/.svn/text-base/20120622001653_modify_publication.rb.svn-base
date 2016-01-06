class ModifyPublication < ActiveRecord::Migration
  def up
    remove_column :publications, :faculty_member_id
  end

  def down
    add_column :publications, :faculty_member_id
  end
end
