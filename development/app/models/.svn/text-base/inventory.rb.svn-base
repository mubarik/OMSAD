class Inventory < ActiveRecord::Base
  belongs_to :inventory_type
  belongs_to :inventory_status
  belongs_to :research_grant
  has_one :printer , :dependent=>:destroy
    accepts_nested_attributes_for :printer,:reject_if => lambda { |a| a[:technology].blank? }, :allow_destroy => true #:dependent => :destroy
  has_one :scanner, :dependent=>:destroy
    accepts_nested_attributes_for :scanner, :reject_if => lambda { |a| a[:scannertype].blank? },:allow_destroy => true #:dependent => :destroy
  has_one :lcd, :dependent=>:destroy
    accepts_nested_attributes_for :lcd, :reject_if => lambda { |a| a[:lcdtype].blank? },:allow_destroy => true #:dependent => :destroy
  has_one :cpu, :dependent=>:destroy
    accepts_nested_attributes_for :cpu, :reject_if => lambda { |a| a[:processorname].blank? },:allow_destroy => true #:dependent => :destroy

  has_many:inventory_ownership_hists, :dependent=>:destroy
  has_one :inventory_ownership, :dependent => :destroy
  has_one :user, :through => :inventory_ownership
  has_one :inventory_location, :dependent=>:destroy
     accepts_nested_attributes_for :inventory_location, :reject_if => lambda { |a| a[:room_detail_id].blank? },:allow_destroy => true
  has_one :location, :through => :inventory_location

  validates :inventoryname ,:presence =>{ :message => 'Inventory ID required'},
                            :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                            :uniqueness => {:message => "Inventory ID already exist"}
  validates_format_of :inventoryname, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :barcode ,:numericality =>{:message => "Enter digits only"},:length => {:minimum => 7, :maximum => 7, :message =>"7 digit barcode required"}, :allow_blank => true
#  validates_format_of :barcode, :with => /^[0-9]+$/,:message => 'Invalid'

  validates :brand, :presence =>{ :message => 'Brand required'},
                    :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :brand, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :model, :presence =>{ :message => 'Model required'},
                    :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :model, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :inventory_type_id, :presence =>{ :message => 'Inventory type required'}

  validates :inventory_status_id, :presence =>{ :message => 'Inventory status required'}

  validates :acqdate, :presence =>{ :message => 'Acquisition date required'}
  def self.all_wrappers

    inventories = Inventory.all
    
      inventory_list_wrappers = Array.new
      imgclass = 'displayPic'
      inventories.each do|inventory|
      if inventory.inventory_type_id    == 1 #Cpu
        imgsrc = 'icpu.jpeg'
      elsif inventory.inventory_type_id == 2 #Printer
        imgsrc = 'iprinter.png'
      elsif inventory.inventory_type_id == 3 #Scanner
        imgsrc = 'iscanner.png'
      elsif inventory.inventory_type_id == 4 #LCD
        imgsrc = 'ilcd.png'
      else
        imgsrc = 'iinv3.jpeg'
      end

      inventory_list_wrapper = IndexWrapper.new( inventory.id,
                                                 imgclass,
                                                 imgsrc,
                                                 inventory.inventoryname,
                                                 'Description:', inventory.description,
                                                 'Brand:',inventory.brand,
                                                 'Model:',inventory.model,
                                                 'Inventory Type:', inventory.inventory_type.inventorytypename,
                                                 'true',
                                                 'inventory/inventories')

        inventory_list_wrappers.push(inventory_list_wrapper)

      end
      
    return inventory_list_wrappers.reverse
    end


   def self.create_inventory(inventoryname,description,brand,model,inventorytype_id,barcode,inventorystatus_id,acqdate,research_grant_id)
      inventory = Inventory.create(:inventoryname => inventoryname, 
                                   :description   => description,
                                   :brand         => brand,
                                   :model         => model ,
                                   :inventory_type_id => inventorytype_id,
                                   :barcode => barcode,
                                   :inventory_status_id => inventorystatus_id,
                                   :acqdate => acqdate,
                                   :research_grant_id=>research_grant_id)
      
    end

   def self.update_inventory(id,inventoryname,description,brand,model,barcode,inventorystatus_id,acqdate)
      inventory = Inventory.find_by_id(id)
      inventory.update_attributes(:inventoryname  => inventoryname,
                                  :description    => description,
                                  :brand          => brand,
                                  :model          => model,
                                  :barcode        => barcode,
                                  :inventory_status_id => inventorystatus_id,
                                  :acqdate => acqdate
                                 )
    end

    def self.delete_inventory(id)
      inventory = Inventory.find_by_id(id)
      inventory.destroy
    end
=begin
      @printers = Printer.where(:inventory_id => inventory.id)
      @printers.each do |printer|
      printer.destroy
      end
=end


end
