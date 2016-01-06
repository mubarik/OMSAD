class AddConfigurationIdToFacultyMemberStatusType < ActiveRecord::Migration
  def change
    add_column :faculty_member_status_types, :project_conf_id, :integer
  end
end
