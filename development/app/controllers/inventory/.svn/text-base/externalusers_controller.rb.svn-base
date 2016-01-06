class Inventory::ExternalusersController < ApplicationController
 def index
    @externalusers = ExternalUser.all
    
  end

 def new
     
  end

 def create
    externaluser = ExternalUser.create_externaluser(params[:employee_id],
                                           params[:designation],
                                           params[:description]
                                         )

  
    if externaluser.save
   
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
end
