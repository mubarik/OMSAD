class Inventory::LocationreportsController < ApplicationController

    add_breadcrumb 'Room Reports','locationreports'

  def create
    @inv_types = LocationType.all
    if (params[:selectreport] == "1")   #Location Allocation Report
      @locs_grid = initialize_grid(Location,:include=>[:user,:location_ownership,:room_detail=>[:location_type]], :name => 'locAllocationReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locAllocationReport')
        render( :partial => 'inventory/locationreports/locAllocationReport',
                :locals => {:locs_grid=>@locs_grid},
                :layout => false)

    elsif (params[:selectreport] == "2") #Location History Report
      @locs_grid = initialize_grid(LocationOwnershipHist,:include=>[:user,:location=>[:room_detail=>[:location_type]]], :name => 'locHistoryReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locHistoryReport')
        render( :partial => 'inventory/locationreports/locHistoryReport',
                :locals => {:locs_grid=>@locs_grid},
                :layout => false)
    elsif (params[:selectreport] == "3") #Location Type Report
      @locs_grid = initialize_grid(Location,:include=>[:user,:location_ownership,:room_detail=>[:location_type]], :name => 'locTypeReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locTypeReport')
        render( :partial => 'inventory/locationreports/locTypeReport',
                :locals => {:locs_grid=>@locs_grid},
                :layout => false)
   end
    #redirect_to :action => "index",:selectreport=>params[:selectreport],:invtype=>params[:invtype]
  end

  def index
    @inv_types = LocationType.all
    if (params[:selectreport] == "1")   #Location Allocation Report
      @locs_grid = initialize_grid(Location,:include=>[:user,:location_ownership,:room_detail=>[:location_type]], :name => 'locAllocationReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locAllocationReport')
      export_grid_if_requested('locAllocationReport' => 'locAllocationReport') do
        render( :partial => 'inventory/locationreports/locAllocationReport',
                :locals => {:locAllocation=>@locs_grid},
                :layout => false)
      end

    elsif (params[:selectreport] == "2") #Location History Report
      @locs_grid = initialize_grid(LocationOwnershipHist,:include=>[:user,:location=>[:room_detail=>[:location_type]]], :name => 'locHistoryReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locHistoryReport')
      export_grid_if_requested('locHistoryReport' => 'locHistoryReport') do
        render( :partial => 'inventory/locationreports/locHistoryReport',
                :locals => {:locHist=>@locs_grid},
                :layout => false)
      end
    elsif (params[:selectreport] == "3") #Location Type Report
      @locs_grid = initialize_grid(Location,:include=>[:user,:location_ownership,:room_detail=>[:location_type]], :name => 'locTypeReport',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'locTypeReport')
      export_grid_if_requested('locTypeReport' => 'locTypeReport') do
        render( :partial => 'inventory/locationreports/locTypeReport',
                :locals => {:locType=>@locs_grid},
                :layout => false)
      end
   end
  end
end

