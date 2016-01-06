require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  fixtures :locations
 def setup
    @location = locations(:locationtest)
  end
   test "should not save location details if name has special characters" do
    locObj = Location.new(

     :locationname  => "Room",
      #"^&^" or nil

      :room_detail_id=> 3,
       #"^&^" or nil

      :location_type_id=> 2

    )
    assert !locObj.save, locObj.errors.inspect
  end

  test "should not save location details if room detail id is nil" do
    locObj = Location.new(

     :locationname  => "Room",
      #"^&^" or nil

      :room_detail_id=>nil,
       #"^&^" or nil

      :location_type_id=> 2

    )
    assert !locObj.save, locObj.errors.inspect
  end

  test "should not save location details if location type id is nil" do
    locObj = Location.new(

     :locationname  => "Room",
      #"^&^" or nil

      :room_detail_id=> 3,
       #"^&^" or nil

      :location_type_id=> nil

    )
    assert !locObj.save, locObj.errors.inspect
  end

 def test_associations
    assert_working_associations
  end

end
