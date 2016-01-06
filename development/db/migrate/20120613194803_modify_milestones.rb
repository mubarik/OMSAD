class ModifyMilestones < ActiveRecord::Migration
  def up
    unless column_exists? :milestones , :faculty_id
      add_column :milestones , :faculty_member_id, :integer
    else
      rename_column :milestones , :faculty_id, :faculty_member_id
    end
    rename_column :milestones , :topic ,:title
    rename_column :milestones , :supervisorname, :cosupervisor
    rename_column :milestones , :firstreport, :firstqualifier
    rename_column :milestones , :secondreport,:secondqualifier
    remove_column :milestones , :thirdreport
    add_column :milestones , :qualifierstatus, :string
    add_column :milestones , :gre, :string
    rename_column :milestones , :defense, :thesisdefence
    remove_column :milestones , :finalsubmission
    remove_column :milestones , :notification
    add_column :milestones , :panelone, :string
    add_column :milestones , :paneltwo, :string
    add_column :milestones , :panelthree, :string
  end

  def down
    #remove_column :milestones , :faculty_id
  end
end
