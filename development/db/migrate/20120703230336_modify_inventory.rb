class ModifyInventory < ActiveRecord::Migration
  def up

    add_column :inventories , :inventory_status_id, :integer
    add_column :inventories , :barcode, :integer
    add_column :inventories , :acqdate, :date
    add_column :inventories , :research_grant_id, :integer
  end

  def down

  end
end
