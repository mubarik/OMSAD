class AddConfigurationIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :project_conf_id, :integer
  end
end
