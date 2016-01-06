class Inventory::PrintersController < ApplicationController
  def index
    @printers = Printer.all
    @inventory = Inventory.all
  end

  def show
  end

  def new

  end

  def edit
    @inventory = Inventory.find_by_id(params[:id])
    @inventorytypes = InventoryType.find_by_id(@inventory.inventory_type_id)
    #@invowner = InventoryOwnership.find_by_id(params[:id])
    #@username = User.find_by_id(@invowner.user_id)
    @users         = User.all
    @printer = Printer.find_by_inventory_id (@inventory.id)
  end

  def create
    printer = Printer.create_printer(params[:inventory_id],params[:technology],params[:speed],params[:memory],params[:mediatype])
    redirect_to :action => "index"
  end

  def destroy
    Printer.delete_printer(params[:id])
  end
  

   def update
    @printer = Printer.update_printer( params[:id],params[:technology], params[:speed],params[:memory],params[:mediatype])
    redirect_to :action => "edit"
  end
end






