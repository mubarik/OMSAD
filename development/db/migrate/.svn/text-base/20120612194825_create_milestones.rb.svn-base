class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :student_id
      t.string :supervisorname
      t.date :proposalsubmission
      t.date  :firstreport
      t.date  :secondreport
      t.date  :thirdreport
      t.date  :notification
      t.date  :defense
      t.date  :finalsubmission
      t.string  :topic
      t.text  :supervisorcomments
      t.timestamps
    end
  end
end