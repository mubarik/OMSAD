class CreateInventoryStatuses < ActiveRecord::Migration
  def change
    create_table :inventory_statuses do |t|
      t.string :inventorystatus
      t.timestamps
    end
  end
end
