class AddConfigurationIdToRank < ActiveRecord::Migration
  def change
    add_column :ranks, :project_conf_id, :integer
  end
end
