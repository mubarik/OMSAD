class Roomdetailmap < ActiveRecord::Base
    belongs_to :room_detail

   def self.update_roomdetailmap(id,room_detail_id)
      maploc = Roomdetailmap.find_by_map_location_id(id)
      maploc.update_attributes(:room_detail_id=>room_detail_id,:status=>"Occupied")
   end

   def self.deallocate_roomdetailmap(map_location_id)
      maploc = Roomdetailmap.find_by_map_location_id  (map_location_id)
      maploc.update_attributes(:room_detail_id=>"0",:status=>"Available")
   end

end
