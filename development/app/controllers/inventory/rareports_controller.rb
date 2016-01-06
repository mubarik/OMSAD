class Inventory::RareportsController < ApplicationController

  def create
    @inv_types = InventoryType.all
    @inv_status = InventoryStatus.all
    @inv_Printers = Inventory.find_by_inventory_type_id(2)
#
    @query = false

    if (params[:selectreport] == "1") #Inventory Type Report
      @ra_grid = initialize_grid(ResearchAssistant, :include=>[:user], :name => 'rareport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'rareport')
      render(:partial => 'inventory/rareports/rareport',
             :locals => {:ra_grid=>@ra_grid},
             :layout => false)

    elsif (params[:selectreport] == "0")
    end
  end

  def index
    @inv_types = InventoryType.all
    @inv_All = Inventory.all
    @inv_status = InventoryStatus.all
    @rooms = RoomDetail.all
    @inv_types = InventoryType.all
    @inv_status = InventoryStatus.all
    @inv_Printers = Inventory.find_by_inventory_type_id(2)
#
    @query = false

    if (params[:selectreport] == "1") #Inventory Type Report
      @ra_grid = initialize_grid(ResearchAssistant, :include=>[:user], :name => 'rareport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'rareport')
      export_grid_if_requested('rareport' => 'rareport') do
        render(:partial => 'inventory/rareports/rareport',
               :locals => {:ra_grid=>@ra_grid},
               :layout => false)
       end
    elsif (params[:selectreport] == "0")
    end

   end
end
