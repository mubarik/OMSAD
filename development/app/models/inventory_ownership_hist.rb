class InventoryOwnershipHist < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :user

  def start_must_be_before_end_date
    return unless startdate and enddate
    errors.add(:startdate, "Start date must be before end date") unless startdate < enddate
  end

  def self.add_inventoryownershiphist(inventoryid,userid,startdate,enddate,ownership_type)
  history = InventoryOwnershipHist.create(
                                    :inventory_id => inventoryid,
                                    :user_id => userid,
                                    :startdate => startdate,
                                    :enddate => enddate,
                                    :ownership_type => ownership_type
                                    )
  end

   def self.update_inventoryownershiphist(inventoryhid,userid,startdate,enddate,ownership_type)
      inventory = InventoryOwnershipHist.find_by_id(inventoryhid)
      inventory.update_attributes(
#                                    
#                                    :user_id => userid,
#                                    :startdate => startdate,
                                    :enddate => enddate,
                                    :ownership_type => ownership_type
                                 )
   end

  before_destroy :check
   def check
     @invhist = InventoryOwnershipHist.where("id = #{self.id}")
     @invhist.each do |hist|
       if hist.ownership_type == 1
         InventoryOwnershipHist.add_inventoryownershiphist(hist.inventory_id, 1, hist.startdate, hist.enddate, 1)
       end
      end
   end
 
end
