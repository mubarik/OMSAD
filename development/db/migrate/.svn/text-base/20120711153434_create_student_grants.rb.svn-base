class CreateStudentGrants < ActiveRecord::Migration
  def change
    create_table :student_grants do |t|
      t.integer :milestone_id
      t.date :fundingmonth
      t.float :totalamount
      t.float :usedamount
      t.float :remainingamount

      t.timestamps
    end
  end
end
