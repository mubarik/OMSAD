class CreateWorkshopStatuses < ActiveRecord::Migration
  def change
    create_table :workshop_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end
