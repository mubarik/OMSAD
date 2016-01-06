class Inventory::TareportsController < ApplicationController
   def create
    @inv_types = InventoryType.all
    @inv_status = InventoryStatus.all
    @inv_Printers = Inventory.find_by_inventory_type_id(2)
#
    @query = false

    if (params[:selectreportTA] == "1") #TA Report
#      @tasks_grid = initialize_grid(TAssistant, :include=>[:user,:ta_courses =>[:semesters,:courses]])

#      @tassistant = TAssistant.find_last_by_employee_id (params[:employee_id])
#      if (!@tassistant.blank?)
@t_assistant=TAssistant.find_by_id(params[:tauser][:id])
        @ta_grid =  initialize_grid(TaCourse.where(:user_id=>@t_assistant.user_id),:include =>[:course,:semester,:user=>[:t_assistant]],:name=>"tareport",:per_page => 40,
#         @ta_grid =  initialize_grid(TaCourse.where(:t_assistant_id=>params[:tauser][:id]),:include =>[:course,:semester,:t_assistant=>[:user]],:name=>"tareport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'tareport')
#            @tasks_grid =  initialize_grid(TaCourse.where(:user_id=>params[:tauser][:id]),:include =>[:course,:semester,:t_assistant=>[:user]],:per_page => 40)
#
#      end
           render(:partial => 'inventory/tareports/tareport',
           :locals => {:ta_grid=>@ta_grid},
           :layout => false)

     elsif (params[:selectreportTA] == "0")
       
     end
  end

  def index
    @inv_types = InventoryType.all
    @inv_All = Inventory.all
    @inv_status = InventoryStatus.all
    @rooms = RoomDetail.all
    @talist = TAssistant.all            #User.joins(:t_assistant).all
    @inv_Printers = Inventory.find_by_inventory_type_id(2)
    @query = false

    if (params[:selectreportTA] == "1") #TA Report
        @t_assistant=TAssistant.find_by_id(params[:tauser][:id])
        @ta_grid =  initialize_grid(TaCourse.where(:user_id=>@t_assistant.user_id),:include =>[:course,:semester,:user=>[:t_assistant]],:name=>"tareport",:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'tareport')
       export_grid_if_requested('tareport' => 'tareport') do
         render(:partial => 'inventory/tareports/tareport',
         :locals => {:ta_grid=>@ta_grid},
         :layout => false)
       end
    elsif (params[:selectreportTA] == "0")

    end

   end
end
