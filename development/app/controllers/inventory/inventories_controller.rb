 class Inventory::InventoriesController < ApplicationController
  require 'csv'

  require 'index_wrapper'
  require 'dynamicdivconstants'
  include DynamicDivConstants

  add_breadcrumb 'Inventories', 'inventories'
  add_breadcrumb 'Add Inventory', '', :only => [:new, :create]
  add_breadcrumb 'Edit Inventory','', :only => [:edit, :update]
  add_breadcrumb 'Inventory Allocation/De-Allocation','', :only => [:inventory_allocation]
  add_breadcrumb 'Configurations','', :only => [:configuration]


     def add_ownership_history

     if params[:ownership_type] == '2'   #Ownership type is history Then
     InventoryOwnershipHist.add_inventoryownershiphist(
                                                  params[:invid],
                                                  params[:user_hist][:id],
                                                  params[:invstartdatehist],
                                                  params[:invenddatehist],
                                                  params[:ownership_type]
                                                 )

###########################################
#Date merging code goes here
###########################################
    @hist_array = Array.new

    #@hist = InventoryOwnershipHist.find_all_by_inventory_id(params[:invid])
    @hist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],2)
    #@cur_owner = InventoryOwnershipHist.find_by_inventory_id_and_ownership_type(params[:invid],1)
    @hist_array = @hist

    #raise "#{@hist.length}"

    @hist_array.sort_by!{|x| [x[:user_id], x[:startdate]]}

    j = 0
    len=@hist_array.length

    while j < len-1
    #for j in 0..len-2
    if !(@hist_array[j].nil?)
          if ((@hist_array[j].user_id == @hist_array[j+1].user_id ) and (@hist_array[j].ownership_type == @hist_array[j+1].ownership_type))
            if (
                ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 1) or ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 0)
               )
                @hist_array[j+1].startdate = @hist_array[j].startdate
                @hist_array.delete_at(j)
                
#          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].enddate <= @hist_array[j].enddate)
#                @hist_array.delete_at(j+1)
          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                @hist_array[j].enddate = @hist_array[j+1].enddate
                @hist_array.delete_at(j+1)
              
          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                @hist_array.delete_at(j+1)
              
            else
              j = j+1
            #raise "#{@hist_array[j].enddate}"
            end

          else
            j = j+1
          end

      end
      len=@hist_array.length
    end
     
      @allhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],'2')

      @allhist.each do |inv|
       inv.destroy
     end
      

        len=@hist_array.length
        for a in 0..len-1

        InventoryOwnershipHist.add_inventoryownershiphist(@hist_array[a].inventory_id,
                                                          @hist_array[a].user_id,
                                                          @hist_array[a].startdate,
                                                          @hist_array[a].enddate,
                                                          @hist_array[a].ownership_type)
        end
###########################################
###########################################


       redirect_to :action => "edit", :id => params[:invid]
     elsif params[:ownership_type] == '1' #Ownership type is Current
      if  params[:invenddate] !=nil or  params[:invenddate] != ''

          InventoryOwnershipHist.update_inventoryownershiphist(params[:invhid2], params[:invuserid], params[:invstartdate], params[:invenddate], '2')
          InventoryOwnershipHist.add_inventoryownershiphist(params[:invid], params[:newuser][:id],   params[:invstartdate2],params[:invenddate2], '1')

          @prev_end_date      = params[:invenddate]
          @prev_newstart_date = params[:invstartdate2]

  #Check if any gap exists - Then insert row with Default owner
           if ((Date.parse(params[:invstartdate2])-Date.parse(params[:invenddate])).to_i  >= 1)
              InventoryOwnershipHist.add_inventoryownershiphist(params[:invid], 1, params[:invenddate],  params[:invstartdate2], '2')
           end
      ###########################################
      #Date merging code goes here
      ###########################################
          @hist_array = Array.new

          @hist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],2)
          @hist_array = @hist

          @hist_array.sort_by!{|x| [x[:user_id], x[:startdate]]}

          j = 0
          len=@hist_array.length

          while j < len-1
          #for j in 0..len-2
          if !(@hist_array[j].nil?)
                if ((@hist_array[j].user_id == @hist_array[j+1].user_id ) and (@hist_array[j].ownership_type == @hist_array[j+1].ownership_type))
                  if (
                      ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 1) or ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 0)
                     )
                      @hist_array[j+1].startdate = @hist_array[j].startdate
                      @hist_array.delete_at(j)
      #          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].enddate <= @hist_array[j].enddate)
      #                @hist_array.delete_at(j+1)
                elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                      @hist_array[j].enddate = @hist_array[j+1].enddate
                      @hist_array.delete_at(j+1)

                elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                      @hist_array.delete_at(j+1)

                  else
                    j = j+1
                  #raise "#{@hist_array[j].enddate}"
                  end

                else
                  j = j+1
                end

            end
            len=@hist_array.length
          end

            @allhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],2)
           
            @allhist.each do |inv|
             inv.destroy
           end

              len=@hist_array.length
              for a in 0..len-1

              InventoryOwnershipHist.add_inventoryownershiphist(@hist_array[a].inventory_id,
                                                                @hist_array[a].user_id,
                                                                @hist_array[a].startdate,
                                                                @hist_array[a].enddate,
                                                                @hist_array[a].ownership_type)
              end
      ###########################################
      ###########################################

      end

       redirect_to :action => "edit", :id => params[:invid]
     end
  end



   def add_indexownership_history
      if  params[:invenddate] !=nil or  params[:invenddate] != ''

          InventoryOwnershipHist.update_inventoryownershiphist(params[:invhid2], params[:invuserid], params[:invstartdate], params[:invenddate], '2')
          InventoryOwnershipHist.add_inventoryownershiphist(params[:invid], params[:newuser][:id],   params[:invstartdate2],params[:invenddate2], '1')

          @prev_end_date      = params[:invenddate]
          @prev_newstart_date = params[:invstartdate2]

  #Check if any gap exists - Then insert row with Default owner
           if ((Date.parse(params[:invstartdate2])-Date.parse(params[:invenddate])).to_i  >= 1)
              InventoryOwnershipHist.add_inventoryownershiphist(params[:invid], 1, params[:invenddate],  params[:invstartdate2], '2')
           end

      end
      if params[:room_detail_id][:id].blank?

      else
      InventoryLocation.add_invloc(params[:invid],
                                               params[:room_detail_id][:id],
                                               params[:location_id][:id])
      end

###########################################
#Date merging code goes here
###########################################
    @hist_array = Array.new

    @hist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],2)
    @hist_array = @hist

    @hist_array.sort_by!{|x| [x[:user_id], x[:startdate]]}

    j = 0
    len=@hist_array.length

    while j < len-1
    #for j in 0..len-2
    if !(@hist_array[j].nil?)
          if ((@hist_array[j].user_id == @hist_array[j+1].user_id ) and (@hist_array[j].ownership_type == @hist_array[j+1].ownership_type))
            if (
                ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 1) or ((Date.parse(@hist_array[j+1].startdate.to_s) - Date.parse(@hist_array[j].enddate.to_s)).to_i == 0)
               )
                @hist_array[j+1].startdate = @hist_array[j].startdate
                @hist_array.delete_at(j)
#          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].enddate <= @hist_array[j].enddate)
#                @hist_array.delete_at(j+1)
          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                @hist_array[j].enddate = @hist_array[j+1].enddate
                @hist_array.delete_at(j+1)

          elsif (@hist_array[j+1].startdate >= @hist_array[j].startdate and @hist_array[j+1].startdate <= @hist_array[j].enddate and @hist_array[j+1].enddate <= @hist_array[j].enddate and @hist_array[j+1].enddate >= @hist_array[j].startdate)
                @hist_array.delete_at(j+1)

            else
              j = j+1
            #raise "#{@hist_array[j].enddate}"
            end

          else
            j = j+1
          end

      end
      len=@hist_array.length
    end

      @allhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:invid],2)

      @allhist.each do |inv|
       inv.destroy
     end

        len=@hist_array.length
        for a in 0..len-1

        InventoryOwnershipHist.add_inventoryownershiphist(@hist_array[a].inventory_id,
                                                          @hist_array[a].user_id,
                                                          @hist_array[a].startdate,
                                                          @hist_array[a].enddate,
                                                          @hist_array[a].ownership_type)
        end
###########################################
###########################################

       redirect_to :action => "index"
  end


   def popuphistory
        @inventory  = Inventory.new
        @users      = User.all_with_owner
        @invhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:id], 1)
        
        render :action=> 'popuphistory', :layout => false
   end




   def inventory_allocation
    @inventorytypes = InventoryType.all
    @inventories = Inventory.all
    @users          = User.all
    @invownhists=InventoryOwnershipHist.all
  end

  def inventory_allocation_edit
    @inventorytypes = InventoryType.all
    @inventories = Inventory.all
    @invownhists=InventoryOwnershipHist.all
    @users          = User.all
  end

  def populate_inventory_allocation
     inventories_data = {}
    @inventories = Inventory.find(:all, :conditions => ["inventory_type_id =?", params[:id]])
    #@locations = Location.select(:id, :locationname).where(:room_detail_id=>params[:id])
#    offeredcourses[params[:id]] = "room222"
    @inventories.each {|inv| inventories_data[inv.id]= inv.inventoryname}
    respond_to do |format|
      format.json { render :json => inventories_data }
    end
  end

  def testt
       @invrec = Inventory.find_by_id(params[:inventory][:id])
       
      @invownhists=InventoryOwnershipHist.where(:inventory_id => params[:inventory][:id] )
     
      #redirect_to :controller => :inventories , :action => "inventory_allocation" , :invownhists11 => @invownhists11
#      @ra_grid = initialize_grid(InventoryOwnershipHist.where(:inventory_id => params[:inventory][:id] , :ownership_type => '2'), :include=>[:user,:inventory=>[:inventory_type]], :name => 'rareport',:per_page => 40  )
#      render(:partial => 'inventory/inventories/historyrecs',
#             :locals => {:ra_grid=>@ra_grid},
#             :layout => false)
  end

  def configuration

  end


 def csv_import
       @inventoryfile = Inventoryfile.new
       render :action=>'csv_import'
 end

def data_import

     #@parsed_file=CSV::Reader.parse(params[:dump][:file])
     #@parsed_file =params[:file]
     #/home/ist/Integration/development/customer.csv
     #
     #csv = CSV.parse(your_csv_file, {:headers => true})

  #Another way to slice header
=begin
    csv_contents = CSV.parse(File.read(file))
    csv_contents.slice!(0)
    csv=""
    csv_contents.each do |content|
      csv<<CSV.generate_line(content)
    end
=end
     @inventoryfile = Inventoryfile.new(params[:inventoryfile])
     n=0
# if user wants to save inventory file then one un-comment this line
    if @inventoryfile.save
     file =  File.path(@inventoryfile.uploadfile.path)
     CSV.foreach(file, :headers => "true")  do |row|
       c=Inventoryfile.new(params[:inventoryfile])
       c.inventory_type   =row[0]
       c.inventory_id     =row[1]
       c.barcode          =row[2]
       c.inventory_status =row[3]
       c.brand            =row[4]
       c.model            =row[5]
       c.department       =row[6]
       c.sn               =row[7]
       c.grn              =row[8]
       c.ram              =row[9]
#Processor Attributes
       c.rom              =row[10]
       c.processor        =row[11]
       c.cores            =row[12]
       c.threads          =row[13]
       c.memory           =row[14]
       c.harddisk         =row[15]
       c.dvdrom           =row[16]
       c.cdrom            =row[17]
       c.keyboard         =row[18]
       c.mouse            =row[19]
       c.soundcard        =row[20]
       c.vga              =row[21]
#Printer
       c.speed            =row[22]
       c.mediatype        =row[23]
       c.technology       =row[24]
#Scanner
       c.resolution       =row[25]
       c.scansize         =row[26]
       c.fileformat       =row[27]
       c.scannertype      =row[28]
#LCD
       c.lcdtype          =row[29]
       c.screensize       =row[30]

#General attributes
       c.attribute1       =row[31]
       c.attribute2       =row[32]
       c.attribute3       =row[33]
       c.attribute4       =row[34]
       c.attribute5       =row[35]

       if c.save
        #n=n+1
        GC.start if n%50==0

      flash[:msgGreen]="CSV Import Successful"
     else
       flash[:msgRed]= "Error while importing File."
     end

    #n=0
#Traverse through all file records and populate them in their respective tables
     inventories = Inventoryfile.all

     inventories.each do|inv|
      if inv.inventory_type    == "Cpu"         #1 Cpu
                @inventory = Inventory.create_inventory(inv.inventory_id,'',inv.brand,inv.model,1, inv.barcode,1,Date.today(),'')
                if @inventory.save
                  Cpu.create_cpu(@inventory.id, inv.processor, inv.cores, inv.threads, inv.memory, inv.harddisk, inv.dvdrom, inv.cdrom, inv.keyboard, inv.mouse, inv.soundcard, inv.vga, inv.ram)
                  InventoryOwnershipHist.add_inventoryownershiphist(@inventory.id, 1, Date.today, '',1)
                   n=n+1
                end

      elsif inv.inventory_type == "Printer"     #2 Printer
        @inventory = Inventory.create_inventory(inv.inventory_id,'',inv.brand,inv.model,2, inv.barcode,1, Date.today(),'')
        if @inventory.save
          Printer.create_printer(@inventory.id, inv.technology, inv.speed, '', inv.mediatype)
          InventoryOwnershipHist.add_inventoryownershiphist(@inventory.id, 1, Date.today, '',1)
           n=n+1
        end

      elsif inv.inventory_type == "Scanner"  #3 Scanner

        @inventory = Inventory.create_inventory(inv.inventory_id,'',inv.brand,inv.model,3, inv.barcode,1,Date.today(),'')
        if @inventory.save
          Scanner.create_scanner(@inventory.id, inv.scannertype, inv.resolution, inv.scansize, inv.fileformat)
          InventoryOwnershipHist.add_inventoryownershiphist(@inventory.id, 1, Date.today, '',1)
           n=n+1
        end

      elsif inv.inventory_type == "Lcd"      #4 LCD
            @inventory = Inventory.create_inventory(inv.inventory_id,'',inv.brand,inv.model,4, inv.barcode,1,Date.today(),'')
            if @inventory.save
              Lcd.create_lcd(@inventory.id, inv.lcdtype, '', inv.screensize)
              InventoryOwnershipHist.add_inventoryownershiphist(@inventory.id, 1, Date.today, '',1)
               n=n+1
            end
#for generalized inventories
      elsif inv.inventory_type != "Cpu" || inv.inventory_type != "Printer" || inv.inventory_type != "Scanner" || inv.inventory_type != "Lcd"
        if inv.inventory_type != ""
          @inventory = Inventory.create_inventory(inv.inventory_id,'',inv.brand,inv.model,5, inv.barcode,1,Date.today(),'')
           if @inventory.save
              InventoryOwnershipHist.add_inventoryownershiphist(@inventory.id, 1, Date.today, '',1)
               n=n+1
           end
        end

       end
      end

    @invlist = Inventoryfile.all
    @invlist.each do |invfilerecord|
      invfilerecord.destroy
    end

#    if @inventory.save
#        flash[:msgGreen]="CSV Import Successful,  #{n} new records added."
#     else
#       flash[:msgRed]= "Error while importing File."
#     end
   end
   redirect_to :action => "index"

    else
        flash[:msgRed]= "Error while importing File. Only CSV file Allowed"
        render "csv_import"
    end
end





  def popupindexhistory
        @inventory  = Inventory.new
        @users      = User.all_with_owner
        @allrooms   = RoomDetail.all
        @locations = []

        @invhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:id], 1)
        render :action=> 'popupindexhistory', :layout => false
   end
   def popuphistory
        @inventory  = Inventory.new
        @users      = User.all_with_owner
                @invhist = InventoryOwnershipHist.find_all_by_inventory_id_and_ownership_type(params[:id], 1)
        render :action=> 'popuphistory', :layout => false
   end

  def index
#    flash.clear
#    add_breadcrumb "All Inventories", ''
    @inventory_list_wrappers = Inventory.all_wrappers
  end

  def invreport
    redirect_to :action => "invreport"
  end


  def populate_locations
    locations_data = {}
    @locations = Location.find(:all, :conditions => ["room_detail_id =?", params[:id]])
    #@locations = Location.select(:id, :locationname).where(:room_detail_id=>params[:id])
#    offeredcourses[params[:id]] = "room222"
    @locations.each {|loc| locations_data[loc.id]= loc.locationname}
    respond_to do |format|
      format.json { render :json => locations_data }
    end
    
  end
  
  def show
    flash.clear
    if params[:id] == 'inventories'
      redirect_to :action=>'index'
    else
      @tasks_grid = initialize_grid(Inventory)
      @inventory  = Inventory.find_by_id(params[:id])
      @inventorytypes = InventoryType.all
      @inventorytype  = InventoryType.find_by_id(@inventory.inventory_type_id)

      @invloc = InventoryLocation.find_by_inventory_id(params[:id])


      #add_breadcrumb @inventory.inventory_type.id, ''

      @inventoryownerships  = InventoryOwnership.all
      @inventoryowner       = InventoryOwnership.find_by_inventory_id(@inventory.id)

      @users         = User.all
      @printers      = Printer.all

      @cpu = Cpu.find_by_inventory_id (@inventory.id)
      @printer = Printer.find_by_inventory_id (@inventory.id)
      @scanner = Scanner.find_by_inventory_id (@inventory.id)
      @lcd = Lcd.find_by_inventory_id (@inventory.id)

      @invownhists = InventoryOwnershipHist.find_all_by_inventory_id(@inventory.id,:order => "startdate desc")
      
      add_breadcrumb @inventory.inventoryname, ''
#      @viewing = params[:viewing]
    end
    
  end

  def new
    flash.clear
    @inventorytypes = InventoryType.all
    @rooms = RoomDetail.all
    @locations = Location.all
    @users          = User.all
    @invstatus = InventoryStatus.all
    @researchgrants = ResearchGrant.all

    @inventory = Inventory.new
    @inventory.build_printer
    @inventory.build_scanner
    @inventory.build_cpu
    @inventory.build_lcd
    @inventory.build_inventory_ownership
    @inventory.build_inventory_location
  end

  def edit
    flash.clear
    @inventory      = Inventory.find_by_id(params[:id])
    if @inventory.inventory_location.blank?
      @inventory.build_inventory_location
    end

    if @inventory.research_grant.blank?
      @inventory.build_research_grant
    end

    @rooms = RoomDetail.all
    @locations = Location.all
    @researchgrants = ResearchGrant.all

    @inventorytypes = InventoryType.find_by_id(@inventory.inventory_type_id)
    #@invstatus = InventoryStatus.find_by_id(@inventory.inventory_status_id)
    @inventorytypes = InventoryType.all
    @invstatus = InventoryStatus.all
    @inventorytype = InventoryType.find_by_id(@inventory.inventory_type_id)

    @inventoryownerships = InventoryOwnership.all
    @inventoryowner = InventoryOwnership.find_by_inventory_id(@inventory.id)
    @invownhists = InventoryOwnershipHist.find_all_by_inventory_id(params[:id],:order => "startdate desc")

    #@invowner = InventoryOwnership.find_by_id(params[:id])
    #@username = User.find_by_id(@invowner.user_id)
    @users         = User.all
    @printers      = Printer.all

    @cpu = Cpu.find_by_inventory_id (@inventory.id)
    @printer = Printer.find_by_inventory_id (@inventory.id)
    @scanner = Scanner.find_by_inventory_id (@inventory.id)
    @lcd = Lcd.find_by_inventory_id (@inventory.id)

  end

  def update
    flash.clear
    @inventorytypes = InventoryType.all
    @researchgrants = ResearchGrant.all
    @users          = User.all
    @rooms          = RoomDetail.all
    @locations      = Location.all
    @invstatus      = InventoryStatus.all
    @defaultowner= User.find_by_name("Default Owner")
      @inventory = Inventory.find_by_id(params[:id])

    if @inventory.update_attributes(params[:inventory])
        flash[:notice] = "Inventory successfully updated."
        redirect_to :action => "index"
      else
        flash[:msgRed]="Please enter valid information!"
        render "edit"
    end
    
=begin
                Inventory.update_inventory( params[:id],
                                            params[:inventoryname],
                                            params[:description],
                                            params[:brand],
                                            params[:model],
                                            params[:barcode],
                                            params[:inventorystatus][:id],
                                            params[:acqdate])

    #

 ##########################
   start_array=Array.new
   end_array=Array.new
   id_array =Array.new

    virtual_count = Integer(params[DynamicDivConstants::OwnerVirtualCount])

#     @invhist = InventoryOwnershipHist.find_all_by_inventory_id(params[:id])
#     @invhist.each do |inv|
#       inv.destroy
#     end

    i=1
    j=0
    allow=0



    while i<= virtual_count

      #get values from the dynamic fields
       #owner_name=DynamicDivConstants::OwnerName+i.to_s

       owner_id = DynamicDivConstants::InHistOwner+i.to_s


       owner_start=DynamicDivConstants::InvHistStDate+i.to_s

       owner_end=DynamicDivConstants::InvHistEdDate+i.to_s

        #check for empty fields
    if !params[owner_id].blank? and
            !params[owner_id].empty? and
            !params[owner_start].blank? and
            !params[owner_start].empty? and
            !params[owner_end].blank? and
            !params[owner_end].empty?

        if start_array.length ==0 and end_array.length ==0

            start_array.push(params[owner_start])
            end_array.push(params[owner_end])

            InventoryOwnershipHist.add_inventoryownershiphist(
                                              params[:id],
                                              params[owner_id],
                                              params[owner_start],
                                              params[owner_end]
                                             )
           id_array.push(params[owner_id])
           
        else

          j=0
          index=2
          allow=0
          len=start_array.length
       

##          for j in 0..len
          while j < len




                  if Date.parse(params[owner_start]) < Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) < Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  == 1) and  (params["name_id"+index.to_s]== params[owner_id])

                          start_array.pop()
                          start_array.push(params[owner_start])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif
                     Date.parse(params[owner_start]) > Date.parse(end_array[j]) and
                     Date.parse(params[owner_end]) > Date.parse(end_array[j]) and
                     ((Date.parse(params[owner_start])-Date.parse(end_array[j])).to_i  == 1) and  (params["name_id"+index.to_s]== params[owner_id])

                          end_array.pop()
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif Date.parse(params[owner_start]) < Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) < Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  != 1)
                          start_array.push(params[owner_start])
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif
                     Date.parse(params[owner_start]) > Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) > Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  != 1)
                          start_array.push(params[owner_start])
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  end

                  j=j+1
          end


        end
       end


      i = i+1
     end

   @invhist = InventoryOwnershipHist.find_all_by_inventory_id(params[:id])
     @invhist.each do |inv|
       inv.destroy
     end
     
     #while
        count = 0

         while count< start_array.length
        #add to database

               InventoryOwnershipHist.add_inventoryownershiphist(
                                                  params[:id],
                                                  id_array[count],
                                                  start_array[count],
                                                  end_array[count]
                                                 )
              count=count+1
         end
 ####### it 2 b##########

 ###################

    #    if @inventory.save and @invownership.save

     if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
     iloc =   InventoryLocation.find_by_inventory_id (@inventory.id)
    @invloc = InventoryLocation.update_invloc(iloc.id,
                                              @inventory.id,
                                             params[:roomnumber][:id],
                                             params[:locationname][:id])
    end

      if @inventory.inventory_type_id == 1   #CPU
          icpu = Cpu.find_by_inventory_id(@inventory.id)
          @cpu=Cpu.update_cpu(icpu.id,
                          params[:processorname],
                          params[:numberofcores],
                          params[:numberofthreads],
                          params[:cpumemory],
                          params[:harddisk],
                          params[:dvdrom],
                          params[:cdrom],
                          params[:keyboard],
                          params[:mouse],
                          params[:soundcard],
                          params[:vga],
                          params[:ram]
                        )

      elsif @inventory.inventory_type_id == 2   #Printer
         iprinter = Printer.find_by_inventory_id(@inventory.id)
         @printer=Printer.update_printer(iprinter.id,
                                  params[:technology],
                                  params[:speed],
                                  params[:memory],
                                  params[:mediatype]
                                )


      elsif @inventory.inventory_type_id == 3   #Scanner
         iscanner = Scanner.find_by_inventory_id (@inventory.id)
         @scanner=Scanner.update_scanner(iscanner.id,
                                  params[:scannertype],
                                  params[:resolutionscanner],
                                  params[:scansize],
                                  params[:fileformate]
                                )



      elsif @inventory.inventory_type_id == 4   #LCD
         ilcd = Lcd.find_by_inventory_id(@inventory.id)
         @lcd=Lcd.update_lcd( ilcd.id,
                          params[:lcdtype],
                          params[:resolutionlcd],
                          params[:sizelcd]
                        )

      end

    @default_owner = User.find_by_name("Default Owner")

   if params[:oenddate].blank?

          @invownership = InventoryOwnership.update_inventoryownership(params[:id],
                                                 params[:name][:id],
                                                 params[:ostartdate],
                                                 params[:oenddate]
                                                )

  else

          InventoryOwnership.update_inventoryownership(params[:id],
                                                 @default_owner.id,  #should be default user id here
                                                 params[:oenddate],
                                                 nil
                                                )
          InventoryOwnershipHist.add_inventoryownershiphist(params[:id],
                                                 params[:name][:id],
                                                 params[:ostartdate],
                                                 params[:oenddate]
                                                )


   end

            flash[:msgGreen]="Inventory item successfully updated"
            redirect_to :action => "index"
#    end
=end
end
  
  def create
    flash.clear
    @inventorytypes = InventoryType.all
    @researchgrants = ResearchGrant.all
    @users          = User.all
    @rooms          = RoomDetail.all
    @locations      = Location.all
    @invstatus      = InventoryStatus.all
    @defaultowner= User.find_by_name("Default Owner")
    @inventory = Inventory.new(params[:inventory])
    if @inventory.save
      flash[:msgGreen]="Inventory successfully added"
      #add inventory history for default owner
      InventoryOwnershipHist.add_inventoryownershiphist(
                                                 @inventory.id,
                                                 @defaultowner.id,
                                                 Date.current,
                                                 nil,
                                                 1
                                                 )
        @new_flag = 'false'
        redirect_to :action => "index"
    else
        flash[:msgRed]="Please enter valid information!"
        @new_flag = 'true'
        render "new"
    end

=begin
    @inventory = Inventory.create_inventory(params[:inventoryname],
                                           params[:description],
                                           params[:brand],
                                           params[:model],
                                           params[:inventorytype][:id],
                                           params[:barcode],
                                           params[:inventorystatus][:id],
                                           params[:acqdate]
                                         )

    @invownership=InventoryOwnership.add_inventoryownership(@inventory.id,
                                              params[:name][:id],
                                              params[:ostartdate],
                                              nil
                                             )

    if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
    @invloc = InventoryLocation.add_invloc(@inventory.id,
                                             params[:roomnumber][:id],
                                             params[:locationname][:id])
    end

    ################
     start_array=Array.new
   end_array=Array.new
   id_array =Array.new

    virtual_count = Integer(params[DynamicDivConstants::OwnerVirtualCount])

#     @invhist = InventoryOwnershipHist.find_all_by_inventory_id(params[:id])
#     @invhist.each do |inv|
#       inv.destroy
#     end

    i=1
    j=0
    allow=0



    while i<= virtual_count

      #get values from the dynamic fields
       #owner_name=DynamicDivConstants::OwnerName+i.to_s

       owner_id = DynamicDivConstants::InHistOwner+i.to_s


       owner_start=DynamicDivConstants::InvHistStDate+i.to_s

       owner_end=DynamicDivConstants::InvHistEdDate+i.to_s

        #check for empty fields
    if !params[owner_id].blank? and
            !params[owner_id].empty? and
            !params[owner_start].blank? and
            !params[owner_start].empty? and
            !params[owner_end].blank? and
            !params[owner_end].empty?

        if start_array.length ==0 and end_array.length ==0

            start_array.push(params[owner_start])
            end_array.push(params[owner_end])

            InventoryOwnershipHist.add_inventoryownershiphist(
                                               @inventory.id,
                                              params[owner_id],
                                              params[owner_start],
                                              params[owner_end]
                                             )
           id_array.push(params[owner_id])

        else

          j=0
          index=2
          allow=0
          len=start_array.length


##          for j in 0..len
          while j < len
%%%%%%%%%%%%%%%%%%%%Afia%%%%%%%%%%%%%%%%%%%%%%%%%
if acquisition date is less than start date, assign that period to default owner

 if Date.today > Date.parse(params[:acqdate])
 InventoryOwnershipHist.add_inventoryownershiphist(
                                                 @inventory.id,
                                                 @defaultowner.id,
                                                 params[:acqdate],
                                                Date.current ,
                                                 2
                                                 )
 end
Merging Scenarios???
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                  if Date.parse(params[owner_start]) < Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) < Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  == 1) and  (params["name_id"+index.to_s]== params[owner_id])

                          start_array.pop()
                          start_array.push(params[owner_start])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif
                     Date.parse(params[owner_start]) > Date.parse(end_array[j]) and
                     Date.parse(params[owner_end]) > Date.parse(end_array[j]) and
                     ((Date.parse(params[owner_start])-Date.parse(end_array[j])).to_i  == 1) and  (params["name_id"+index.to_s]== params[owner_id])

                          end_array.pop()
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif Date.parse(params[owner_start]) < Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) < Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  != 1)
                          start_array.push(params[owner_start])
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  elsif
                     Date.parse(params[owner_start]) > Date.parse(start_array[j]) and
                     Date.parse(params[owner_end]) > Date.parse(start_array[j]) and
                     ((Date.parse(start_array[j])-Date.parse(params[owner_end])).to_i  != 1)
                          start_array.push(params[owner_start])
                          end_array.push(params[owner_end])
                          id_array.push(params["name_id"+index.to_s])
                          index=index+1
                          break
                  end

                  j=j+1
          end


        end
       end


      i = i+1
     end

   @invhist = InventoryOwnershipHist.find_all_by_inventory_id( @inventory.id)
     @invhist.each do |inv|
       inv.destroy
     end

     #while
        count = 0

         while count< start_array.length
        #add to database

               InventoryOwnershipHist.add_inventoryownershiphist(
                                                   @inventory.id,
                                                  id_array[count],
                                                  start_array[count],
                                                  end_array[count]
                                                 )
              count=count+1
         end
#    owner_count = Integer(params[DynamicDivConstants::OwnerVirtualCount])
#
#        if @inventory.save
#        i=1
#
#      #begin while (loop to iterate through all dynamically added owners)
#      while i<=owner_count
#
#
#        #get values from the dynamic fields
#        #owner_name=DynamicDivConstants::OwnerName+i.to_s
#        owner_id = DynamicDivConstants::InHistOwner+i.to_s
#        flash[:msgowner]=params[owner_id]
#
#        owner_start=DynamicDivConstants::InvHistStDate+i.to_s
##        flash[:msgstdate]=owner_start
#
#
#        owner_end=DynamicDivConstants::InvHistEdDate+i.to_s
##        flash[:msgeddate]=owner_end
#       #check for empty fields
#        if !params[owner_id].blank? and
#            !params[owner_id].empty? and
#            !params[owner_start].blank? and
#            !params[owner_start].empty? and
#            !params[owner_end].blank? and
#            !params[owner_end].empty?
#       #get owner's object
#       #owner = User.find_by_id(params[owner_name])
#
#        InventoryOwnershipHist.add_inventoryownershiphist(
#                                              @inventory.id,
#                                              params[owner_id],
#                                              params[owner_start],
#                                              params[owner_end]
#                                             )
#        end
#       i = i+1
#       #end while
#       end
#
#      end
    ##########
## This code should be opened to run normal code
=begin
if @inventory.save and @invownership.save

    if @inventory.inventory_type_id == 1   #CPU
      @cpu=Cpu.create_cpu(@inventory.id,
                     params[:processorname],
                     params[:numberofcores],
                     params[:numberofthreads],
                     params[:cpumemory],
                     params[:harddisk],
                     params[:dvdrom],
                     params[:cdrom],
                     params[:keyboard],
                     params[:mouse],
                     params[:soundcard],
                     params[:vga],
                     params[:ram]
                    )
        if @cpu.save
          flash[:msgGreen]="Inventory item successfully added"
          redirect_to :action => "index"
        else
          @inventory.destroy
          @invownership.destroy

          if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
            @invloc.destroy
          end

          flash[:msgRed]="Please enter valid information!"
          render "new"
        end

    elsif @inventory.inventory_type_id == 2   #Printer
      @printer=Printer.create_printer(@inventory.id,
                             params[:technology],
                             params[:speed],
                             params[:memory],
                             params[:mediatype]
                            )

        if @printer.save
          flash[:msgGreen]="Inventory item successfully added"
          redirect_to :action => "index"
        else
          @inventory.destroy
          @invownership.destroy

          if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
            @invloc.destroy
          end

          flash[:msgRed]="Please enter valid information!"
          render "new"
        end

    elsif @inventory.inventory_type_id == 3   #Scanner
      @scanner=Scanner.create_scanner(@inventory.id,
                             params[:scannertype],
                             params[:resolutionscanner],
                             params[:scansize],
                             params[:fileformate]
                            )

        if @scanner.save
          flash[:msgGreen]="Inventory item successfully added"
          redirect_to :action => "index"
        else
          @inventory.destroy
          @invownership.destroy

          if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
            @invloc.destroy
          end

          flash[:msgRed]="Please enter valid information!"
          render "new"
        end

    elsif @inventory.inventory_type_id == 4   #LCD
      @lcd=Lcd.create_lcd( @inventory.id,
                      params[:lcdtype],
                      params[:resolutionlcd],
                      params[:sizelcd]
                    )

        if @lcd.save
          flash[:msgGreen]="Inventory item successfully added"
          redirect_to :action => "index"
        else
          @inventory.destroy
          @invownership.destroy

          if (!params[:roomnumber][:id].blank? and !params[:locationname][:id].blank?)
            @invloc.destroy
          end

          flash[:msgRed]="Please enter valid information!"
          render "new"
        end

    else
      flash[:msgRed]="Please enter valid information!"
    end
else
      flash[:msgRed]="Please enter valid information!"
      render "new"
end
=end

  end

  
  def destroy
      @inventory=Inventory.find_by_id(params[:id])
      @inventory.destroy

      flash[:msgRed] =""
      flash[:msgGreen]="Inventory item successfully deleted"
    redirect_to :action => "index"

  end
  def routing
    redirect_to :action=>"index"
  end
end