class InventoryType < ActiveRecord::Base
  has_many :inventories
  has_many :inventoryownership, :through => :inventories
  
  def index
    @inventorytype = InventoryType.all
  end

  def show
    
  end

end
