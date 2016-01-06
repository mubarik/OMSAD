class CreateInventoryTypes < ActiveRecord::Migration
  def change
    create_table :inventory_types do |t|
      t.string :inventorytypename
      t.string :description
      t.timestamps
    end
  end
end
