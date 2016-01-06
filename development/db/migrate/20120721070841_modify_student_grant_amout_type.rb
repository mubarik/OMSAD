class ModifyStudentGrantAmoutType < ActiveRecord::Migration
  def up
    change_column :student_grants , :totalamount, :integer
    change_column :student_grants , :usedamount, :integer
    change_column :student_grants , :remainingamount, :integer
  end

  def down
    change_column :student_grants , :totalamount, :float
    change_column :student_grants , :usedamount, :float
    change_column :student_grants , :remainingamount, :float
  end
end
