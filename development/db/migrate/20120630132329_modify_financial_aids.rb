class ModifyFinancialAids < ActiveRecord::Migration
  def up
    unless column_exists? :financial_aids , :student_semester_id
      add_column :financial_aids , :student_semester_id, :integer
      add_column :financial_aids , :status, :string
    end
  end

  def down
      remove_column :financial_aids , :student_semester_id
      remove_column :financial_aids , :status
  end
end
