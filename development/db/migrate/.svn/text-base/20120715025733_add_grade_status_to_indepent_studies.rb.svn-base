class AddGradeStatusToIndepentStudies < ActiveRecord::Migration
  def up
    add_column :independent_studies ,:grade_type_id,:integer,:default=>1
    remove_column :independent_studies,:studygrade
  end

  def down
    remove_column :independent_studies ,:grade_type_id
    add_column :independent_studies,:studygrade,:string
  end
end
