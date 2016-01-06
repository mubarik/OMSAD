class AddProbationStatusToStudents < ActiveRecord::Migration
  def up
    add_column :students ,:student_probation_status_type_id,:integer,:default=>1
    remove_column :students,:probationstatus
  end

  def down
    remove_column :students ,:student_probation_status_type_id
    add_column :students,:probationstatus,:string
  end
end
