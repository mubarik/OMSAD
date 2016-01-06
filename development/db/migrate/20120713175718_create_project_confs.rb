class CreateProjectConfs < ActiveRecord::Migration
  def change
    create_table :project_confs do |t|

      t.timestamps
    end
  end
end
