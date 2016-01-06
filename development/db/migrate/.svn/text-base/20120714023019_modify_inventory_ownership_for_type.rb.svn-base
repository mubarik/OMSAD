class ModifyInventoryOwnershipForType < ActiveRecord::Migration
  def up
    add_column     :inventory_ownerships , :ownership_type ,:integer
  end

  def down
     change_column     :inventory_ownerships , :external_user_id 
  end
end
