class Inventory::LocationsController < ApplicationController
  def index
    @locations = Location.all
    @locationtypes = LocationType.all
    @roomdetails = RoomDetail.all
     
  end

  def show
    @location = Location.find_by_id(params[:id])
     
  end

  def new
    @locationtypes = LocationType.all
    @roomdetails = RoomDetail.all
    @location_ownership = Location.location_ownership.build
    #@location_ownership_hist = Location.location_ownership_hists.build
   
  end

  def edit
    @location = Location.find_by_id(params[:id])
    @locationtypes = LocationType.find_by_id(params[:id])
    @roomdetails = RoomDetail.find_by_id([:id])
 
  end

  def update
    location = Location.update_location(params[:id],
                                        params[:locationname],
                                        params[:description]
                                        )
    flash[:msgRed] =""
    flash[:msgGreen]="Updated successfully"
  
    redirect_to :action => "edit"
  end

  def create
    location = Location.create_location(params[:roomdetail][:id],
                                        params[:locationtype][:id],
                                        params[:locationname],
                                        params[:description]
                                        )
    flash[:notice] = location.errors[:locationname]
    flash[:invalidnotice] = location.errors[:locationname]
    flash[:roomnotice] = location.errors[:room_detail_id]
    flash[:typenotice] = location.errors[:locationtype_id]
    if location.save
        flash[:msgRed] =""
      flash[:msgGreen]=" Added successfully"
      redirect_to :action => "new"
    else
       flash[:msgRed] ="An error occured, record cannot be saved"
       flash[:msgGreen]=""
       
    
    redirect_to :action => "new"
    end
    
  end

  def destroy
    Location.delete_location(params[:id])
    flash[:msgRed] =""
      flash[:msgGreen]="Deleted successfully"
 
    redirect_to :action => "new"

  end
end
