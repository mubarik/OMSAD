class Location < ActiveRecord::Base

  has_one :location_ownership , :dependent=>:destroy
    accepts_nested_attributes_for :location_ownership, :allow_destroy => true

  has_many :location_ownership_hists, :dependent=>:destroy
    accepts_nested_attributes_for :location_ownership_hists, :allow_destroy => true

  has_one :user, :through => :location_ownership
  belongs_to :room_detail
  has_one :inventory_location , :dependent=>:destroy
  has_one :inventory, :through =>:inventory_location

  validates :locationname ,:presence =>{ :message => 'not entered'},
                                         :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
                           #:uniqueness => { :message => 'Already saved'}
                         
  validates_format_of :locationname, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'Invalid'
#  validates :room_detail_id,:presence =>true
#  validates :location_type_id,:presence =>true

  
    def self.update_location(id,locationname,description)
      location = Location.find_by_id(id)
      location.update_attributes(:locationname => locationname, :description =>description)
    end

    def self.create_location(room_detail_id,locationtype_id,locationname,description)
      
      location = Location.create(:room_detail_id  => room_detail_id,
                                 :location_type_id => locationtype_id,
                                 :locationname => locationname,
                                 :description => description
                                 )
      return location
    end


    
    def self.delete_location(id)
      location = Location.find_by_id(id)
      location.destroy
    end
    def l_id
      self.id
    end
    def l_locationname
      self.locationname
    end



end
