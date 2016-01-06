class ModifyCosupervisors < ActiveRecord::Migration
  def up
    unless column_exists? :cosupervisors , :independent_study_id
      add_column :cosupervisors , :independent_study_id, :integer
    end
    unless column_exists? :cosupervisors , :type
      add_column :cosupervisors , :type, :string
    end
  end

  def down
    unless !column_exists? :cosupervisors , :independent_study_id
      remove_column :cosupervisors , :independent_study_id
    end
    unless column_exists? :cosupervisors , :type
      remove_column :cosupervisors , :type
    end
  end
end
