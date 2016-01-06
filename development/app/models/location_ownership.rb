class LocationOwnership < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_one :location_type, :through=> :location

 def self.add_locationownership(locationid,userid,startdate,enddate)
   locowner = LocationOwnership.create(:location_id => locationid, :user_id => userid,:startdate => startdate, :enddate => enddate )
 end

  def self.update_locationownership(locownerid,userid,startdate,enddate)
    locownership = LocationOwnership.find_by_id(locownerid)
    locownership.update_attributes(:user_id =>userid, :startdate=>startdate, :enddate=>enddate)
  end
end
