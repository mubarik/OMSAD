class ModifyMilestoneStudentGrants < ActiveRecord::Migration
  def up
    add_column :milestones , :granttype, :string
    add_column :milestones , :grantname, :string
    add_column :milestones , :grantstatus, :string
  end

  def down
    remove_column :milestones , :granttype 
    remove_column :milestones , :grantname
    remove_column :milestones , :grantstatus
  end
end
