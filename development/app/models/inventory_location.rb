class InventoryLocation < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :location
  belongs_to :room_detail

  def self.add_invloc(inventory_id,room_detail_id,location_id)
    InventoryLocation.create(:inventory_id => inventory_id, 
                             :room_detail_id => room_detail_id,
                             :location_id => location_id )
  end
  def self.update_invloc(id,inventory_id,room_detail_id,location_id)
    invloc = InventoryLocation.find_by_id(id)
    invloc.update_attributes(:inventory_id => inventory_id,
                                        :room_detail_id => room_detail_id,
                                        :location_id => location_id )
  end
end
