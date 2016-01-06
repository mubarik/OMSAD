class AddConfigurationIdToConferenceStatus < ActiveRecord::Migration
  def change
    add_column :conference_statuses, :project_conf_id, :integer
  end
end
