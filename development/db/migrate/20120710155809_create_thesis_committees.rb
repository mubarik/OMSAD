class CreateThesisCommittees < ActiveRecord::Migration
  def change
    create_table :thesis_committees do |t|
      t.integer :milestone_id
      t.integer :faculty_member_id
      t.boolean :affiliationwithlums
      t.string :cosupervisorname
      t.string :email
      t.string :designation

      t.timestamps
    end
  end
end
