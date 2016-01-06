class ModifyInventoryOwnership < ActiveRecord::Migration
  def up
    
    add_column     :inventory_ownerships , :usertype ,:string
  end

   def down
    
  end
end
