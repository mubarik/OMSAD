class InventoryOwnership < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :user
  has_one :inventory_type, :through=> :inventory
  

  
 def self.add_inventoryownership(inventoryid,userid,startdate,enddate)
  invowner = InventoryOwnership.create(:inventory_id => inventoryid, :user_id => userid,:startdate => startdate, :enddate => enddate )
 end

 def self.update_inventoryownership(inventoryid,userid,startdate,enddate)
  invowner = InventoryOwnership.find_by_inventory_id(inventoryid)
  invowner.update_attributes(:user_id => userid,:startdate => startdate, :enddate => enddate)
 end

end
