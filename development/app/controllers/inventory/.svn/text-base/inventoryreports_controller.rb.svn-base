class Inventory::InventoryreportsController < ApplicationController
 
     add_breadcrumb 'Inventory Reports','inventoryreports'

  def create
    @inv_types = InventoryType.all
    @inv_status = InventoryStatus.all
    @inv_Printers = Inventory.find_by_inventory_type_id(2)

    @query = false
 #User.where("name = 'Default Owner'")
   if (params[:selectreport] == "1") #Inventory Allocation Report
      @inv_grid = initialize_grid(InventoryOwnershipHist.where("ownership_type = 1 and inventory_id in (select id from inventories)"), :include=>[:user,:inventory=>[:inventory_type]],:name=>"inventoryAllocationReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryAllocationReport')
      render(:partial => 'inventory/inventoryreports/inventoryAllocationReport',
             :locals => {:inv_grid=>@inv_grid},
             :layout => false)

    elsif (params[:selectreport] == "2") #Inventory History Report
#      @invhists_grid = initialize_grid(InventoryOwnership.where(:inventory_id => params[:invprinter][:id]), :include=>[:user,:inventory,:inventory_type])
#      initialize_grid(InventoryOwnership, :include=>[:user,:inventory,:inventory_type])
       @inv_grid = initialize_grid(InventoryOwnershipHist.where(:inventory_id => params[:invprinter][:id]), :include=>[:user,:inventory],:name=>"inventoryHistoryReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryHistoryReport')
       #initialize_grid(InventoryOwnership, :include=>[:user,:inventory,:inventory_type])
      render(:partial => 'inventory/inventoryreports/inventoryHistoryReport',
             :locals => {:inv_grid=>@inv_grid},
             :layout => false)

    elsif (params[:selectreport] == "3") #Inventory Type Report
      @inv_grid = initialize_grid(Inventory.where(:inventory_type_id=>params[:invtype][:id]),:include=>[:user,:inventory_ownership_hists,:inventory_type],:name=>"inventoryTypeReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryTypeReport')
      render(:partial => 'inventory/inventoryreports/inventoryTypeReport',
             :locals => {:inv_grid=>@inv_grid},
             :layout => false)

    elsif (params[:selectreport] == "4") #Inventory Status Report
    @inv_grid = initialize_grid(Inventory.where(:inventory_status_id=>params[:invstatus][:id]),:include=>[:user,:inventory_ownership,:inventory_status,:inventory_type],:name=>"inventoryStatusReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryStatusReport')
    render(:partial => 'inventory/inventoryreports/inventoryStatusReport',
           :locals => {:inv_grid=>@inv_grid},
           :layout => false)

   elsif (params[:selectreport] == "5") #Inventory Allocation By Room Report
    @inv_grid = initialize_grid(InventoryLocation.where(:room_detail_id=>params[:room][:id]),:include=>[[:inventory =>[:inventory_status,:inventory_type,:user]],:room_detail],:name=>"inventoryRoomAllocationReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryRoomAllocationReport')

    render(:partial => 'inventory/inventoryreports/inventoryRoomAllocationReport',
           :locals => {:inv_grid => @inv_grid},
           :layout => false)
    end
    #redirect_to :action => "index",:selectreport=>params[:selectreport],:invtype=>params[:invtype]
  end

  def index
    @inv_types = InventoryType.all
    @inv_All = Inventory.all
    @inv_status = InventoryStatus.all
    @rooms = RoomDetail.all
 #   @inv_All = Inventory.find_by_inventory_type_id(2)

 #  @inv_Scanners = Inventory.find_by_inventory_type_id(3)
 #  @inv_Lcds = Inventory.find_by_inventory_type_id(4)
    @query = false

     if (params[:selectreport] == "1") #Inventory Allocation Report

      @inv_grid = initialize_grid(InventoryOwnershipHist.where("ownership_type = 1"), :include=>[:user,:inventory=>[:inventory_type]],:name=>"inventoryAllocationReport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'inventoryAllocationReport')
        export_grid_if_requested('inventoryAllocationReport' => 'inventoryAllocationReport') do
        render(:partial => 'inventory/inventoryreports/inventoryAllocationReport',
             :locals => {:inv_grid=>@inv_grid},
             :layout => false)
         end

      elsif (params[:selectreport] == "2") #Inventory History Report
  #      @invhists_grid = initialize_grid(InventoryOwnership.where(:inventory_id => params[:invprinter][:id]), :include=>[:user,:inventory,:inventory_type])
  #      initialize_grid(InventoryOwnership, :include=>[:user,:inventory,:inventory_type])
         @inv_grid = initialize_grid(InventoryOwnershipHist.where(:inventory_id => params[:invprinter][:id]), :include=>[:user,:inventory],:name=>"inventoryHistoryReport",:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'inventoryHistoryReport')
         #initialize_grid(InventoryOwnership, :include=>[:user,:inventory,:inventory_type])
         export_grid_if_requested('inventoryHistoryReport' => 'inventoryHistoryReport') do
          render(:partial => 'inventory/inventoryreports/inventoryHistoryReport',
                 :locals => {:inv_grid=>@inv_grid},
                 :layout => false)
         end

      elsif (params[:selectreport] == "3") #Inventory Type Report
        @inv_grid = initialize_grid(Inventory.where(:inventory_type_id=>params[:invtype][:id]),:include=>[:user,:inventory_ownership,:inventory_type],:name=>"inventoryTypeReport",:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'inventoryTypeReport')
        export_grid_if_requested('inventoryTypeReport' => 'inventoryTypeReport') do
          render(:partial => 'inventory/inventoryreports/inventoryTypeReport',
                 :locals => {:inv_grid=>@inv_grid},
                 :layout => false)
        end

      elsif (params[:selectreport] == "4") #Inventory Status Report
      @inv_grid = initialize_grid(Inventory.where(:inventory_status_id=>params[:invstatus][:id]),:include=>[:user,:inventory_ownership,:inventory_status],:name=>"inventoryStatusReport",:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'inventoryStatusReport')
        export_grid_if_requested('inventoryStatusReport' => 'inventoryStatusReport') do
          render(:partial => 'inventory/inventoryreports/inventoryStatusReport',
                 :locals => {:inv_grid=>@inv_grid},
                 :layout => false)
        end

     elsif (params[:selectreport] == "5") #Inventory Allocation By Room Report
      @inv_grid = initialize_grid(InventoryLocation.where(:room_detail_id=>params[:room][:id]),:include=>[[:inventory =>[:inventory_status,:inventory_type,:user]],:room_detail],:name=>"inventoryRoomAllocationReport",:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'inventoryRoomAllocationReport')
      export_grid_if_requested('inventoryRoomAllocationReport' => 'inventoryRoomAllocationReport') do
        render(:partial => 'inventory/inventoryreports/inventoryRoomAllocationReport',
               :locals => {:inv_grid => @inv_grid},
               :layout => false)
      end
    end
  end

end
