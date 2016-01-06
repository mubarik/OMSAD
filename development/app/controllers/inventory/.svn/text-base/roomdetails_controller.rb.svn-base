class Inventory::RoomdetailsController < ApplicationController
  require 'index_wrapper'
  require 'dynamicdivconstants'
  include DynamicDivConstants

  add_breadcrumb 'Rooms', 'roomdetails'
  add_breadcrumb 'Add Room', '', :only => [:new, :create]
  add_breadcrumb 'Edit Room','', :only => [:edit, :update]

  def index
#    flash.clear
#    add_breadcrumb "All Locations", ''
    @roomdetail_list_wrappers = RoomDetail.all_wrappers
  end


  
  def new
    flash.clear
    @roomdetail    = RoomDetail.new
    #@location      = @roomdetail.locations.build
    #@location_ownership = @location.build_location_ownership
    @locationtypes = LocationType.all
    @users         = User.all_with_owner
  end

  
  def create
    flash.clear
    @locationtypes  = LocationType.all
    @users          = User.all_with_owner
    @roomdetail     = RoomDetail.new(params[:room_detail])
    if @roomdetail.locations.empty?
          flash[:msgRed]="Please enter at least one desk!"
          render "new"
      else
        if @roomdetail.save
          flash[:msgGreen]="Room successfully added"
          redirect_to :action => "index"
        else
          flash[:msgRed]="Please enter valid information!"
          render "new"
        end
    end

  end

  def show
    flash.clear
    if params[:id] == 'roomdetails'
      redirect_to :action=>'index'
    else
      @roomdetail = RoomDetail.find_by_id(params[:id])
      @locations   = Location.where(:room_detail_id=>@roomdetail.id)
      @locid       = Location.find_by_room_detail_id(@roomdetail.id)
      @locationowner = LocationOwnership.find_by_location_id(@locid.id)
      
      add_breadcrumb @roomdetail.roomnumber, ''
      @viewing = params[:viewing]
    end


  end

  def edit
        flash.clear
        @roomdetail = RoomDetail.find(params[:id])
        @users      = User.all_with_owner
        @locationtypes = LocationType.all
        @location   = Location.find_by_room_detail_id(@roomdetail.id)
  end

def update

    flash.clear
    @roomdetail = RoomDetail.find_by_id(params[:id])
    @users      = User.all_with_owner
    @locationtypes = LocationType.all
#    @loc_count = RoomDetail.new(params[:room_detail])

#      if @loc_count.locations.empty?
#          flash[:msgRed]="Please enter at least one desk!"
#          render "edit"
#      else

          if @roomdetail.update_attributes(params[:room_detail])
              flash[:notice] = "Room Detail successfully updated."
              redirect_to :action => "index"
            else
              flash[:msgRed]="Please enter valid information!"
              render "edit"
          end
end

def popupassignloc

      @rooms  = RoomDetail.all
      @inventory  = Inventory.new
      @users         = User.all_with_owner

      render :action=> 'popupassignloc', :layout => false
  end

  def assignlocation
         room_detail_id = Roomdetailmap.find_by_room_detail_id(params[:mroom][:id])

         map_loc_id = Roomdetailmap.find_by_map_location_id(params[:hidID])
         #find existing map location , if not occuopied then assign it


          if params[:hidID] == '100'
                flash[:msgGreen]="Please select a map location to save"
                redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:mroomid],:viewing=>"true"
            elsif params[:hidID] == '-1'
                    roomdetailmap = Roomdetailmap.deallocate_roomdetailmap(params[:hidRID],params[:hidRID] )
                    flash[:msgGreen]="Room has been sucessfully de-allocated from map"
                    redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:mroomid],:viewing=>"true"
            else
                if  room_detail_id.blank?
                    roomdetailmap = Roomdetailmap.update_roomdetailmap(params[:hidMapId],params[:mroom][:id])
                    flash[:msgGreen]="Room has been assigned map location successfully"
                    redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:mroomid],:viewing=>"true"
                else
                  flash[:msgGreen]="Room Number already has map location"
                  redirect_to :controller => :roomdetails , :action => "newmap", :id =>0,:viewing=>"true"
                end
            end
   end

   def newmap
       @roomdetail = RoomDetail.find_by_id(params[:id])

       if @roomdetail != nil
        @inv_loc   = InventoryLocation.where(:room_detail_id => @roomdetail.id)
       else
         @roomdetail=RoomDetail.new
         @roomdetail.id=0
       end

       @allallocatedrooms = Roomdetailmap.where("room_detail_id > 0")

       @map_roomdetails = Roomdetailmap.all
        flash[:afii]=@map_roomdetails.length
#       @invcounts=Roomdetailmap.get_invcount()



    end

    def map_room
       @roomdetail = RoomDetail.find_by_id(params[:id])
       @map_roomdetails = Roomdetailmap.all
    end

   def maploc
        room_detail_id = Roomdetailmap.find_by_room_detail_id(params[:roomid])

#       map_loc_id = Roomdetailmap.find_by_map_location_id(params[:hidID])

        #params[:hidRID]
      if params[:hidID] == '100'
          flash[:msgGreen]="Please select a map location to save"
          redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:roomid],:viewing=>"true"
      elsif params[:hidID] == '-1'
                    flash[:afii]=params[:hidcRID]
              roomdetailmap = Roomdetailmap.deallocate_roomdetailmap(params[:hidcRID] )

              flash[:msgGreen]="Room has been sucessfully de-allocated from map"
              redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:roomid],:viewing=>"true"
      else
          if  room_detail_id.blank?
              roomdetailmap = Roomdetailmap.update_roomdetailmap(params[:hidID],params[:roomid] )
              flash[:msgGreen]="Room has been assigned map location successfully"
              redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:roomid],:viewing=>"true"
          else
            flash[:msgGreen]="Room Number already has map location"
            redirect_to :controller => :roomdetails , :action => "newmap", :id =>params[:roomid],:viewing=>"true"
          end
      end
    end

  def destroy
    @roomdetail = RoomDetail.find_by_id(params[:id])
    @location = Location.where(:room_detail_id => @roomdetail.id)
    @location.each do |location|
      location.destroy
    end
    RoomDetail.delete_roomdetail(params[:id])
     flash[:msgRed] =""
     flash[:msgGreen]="Room successfully deleted"
     redirect_to :action => "index"
  end

  def routing
    redirect_to :action=>"index"
  end

end
