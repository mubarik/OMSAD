class AddDegreeStatusTypeToStudent < ActiveRecord::Migration
  def up
    add_column :students ,:student_degree_status_type_id,:integer,:default=>1
    remove_column :students,:degreestatus
  end

  def down
    remove_column :students ,:student_degree_status_type_id
    add_column :students,:degreestatus,:string
  end
end
