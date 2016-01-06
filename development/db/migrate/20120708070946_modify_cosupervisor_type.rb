class ModifyCosupervisorType < ActiveRecord::Migration
  def up
    rename_column :cosupervisors , :type, :cotype
  end

  def down
    rename_column :cosupervisors , :cotype, :type
  end
end
