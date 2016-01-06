class RoomDetail < ActiveRecord::Base
    has_many :locations
      accepts_nested_attributes_for :locations, :allow_destroy => true
    has_one :roomdetailmap
    has_many :inventory_locations
    belongs_to :location_type
    


  validates :roomnumber ,:presence =>{ :message => 'Please enter room number'},
                         :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                           :uniqueness => { :message => 'Room already exist'}
  validates_format_of :roomnumber, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :roomname, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :roomname, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'


    def self.all_wrappers
      roomdetails = RoomDetail.all
      roomdetail_list_wrappers = Array.new
      imgclass = 'displayPic'
      imgsrc = 'loc1.jpeg'
      roomdetails.each do|roomdetail|
      roomdetail_list_wrapper = IndexWrapper.new( roomdetail.id,
                                                  imgclass,
                                                  imgsrc,
                                                  roomdetail.roomnumber,
                                                 'Description:', roomdetail.description,
                                                 'inventory/roomdetails')

        roomdetail_list_wrappers.push(roomdetail_list_wrapper)
      end
      return roomdetail_list_wrappers.reverse
    end

#    def self.create_roomdetail(roomnumber, description,roomname)
#      @roomdetail = RoomDetail.create(:roomnumber => roomnumber,
#                                      :description => description,
#                                      :roomname   => roomname)
#
#      return @roomdetail
#    end

    def self.update_roomdetail(id,roomnumber,roomname,description)
      roomdetail = RoomDetail.find_by_id(id)
      roomdetail.update_attributes(:roomnumber=>roomnumber,:roomname=>roomname,:description=>description)
      return roomdetail
    end

    def self.delete_roomdetail(id)
      roomdetail = RoomDetail.find_by_id(id)
      @locations = Location.where(:room_detail_id => roomdetail.id)
      @locations.each do |location|
      location.destroy
      end
      roomdetail = RoomDetail.find_by_id(id)
      roomdetail.destroy
    end

  def r_id
     self.id
  end
  def r_roomnumber
    self.roomnumber
  end
end
