# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

invs =
[
    {
      :inventorytypename => 'CPU',
      :description => 'Processor Information',
    },

    {
      :inventorytypename => 'Printer',
      :description => 'Printer information',
    },

    {
      :inventorytypename => 'Scanner',
      :description => 'Scanner Information',
    },
    
    {
    :inventorytypename => 'LCD',
    :description => 'LCD Information',
    },
    {
    :inventorytypename => 'General',
    :description => 'All general purpose inventories will be stored here',
    }

]

invs.each do |hash|
    inv = InventoryType.new
    hash.each do |attribute, value|
      inv.update_attribute(attribute, value)
    end
end

locs =
[
    {:locationtypename => 'Lab',:description => 'lab Information',},
    {:locationtypename => 'Room',:description => 'Room Information',},
    {:locationtypename => 'Faculty Office',:description => 'office Information',},
    {:locationtypename => 'Conference Room',:description => 'Conf. room Information',},
    {:locationtypename => 'Auditorium',:description => 'Auditorium Information',},
    {:locationtypename => 'Shared Faculty Office',:description => 'Cubicle Information',},
]

locs.each do |hash|
    loc = LocationType.new
    hash.each do |attribute, value|
      loc.update_attribute(attribute, value)
    end
end

roomdetails =
[
    {:map_location_id => '1',:status => 'Available',},
    {:map_location_id => '2',:status => 'Available',},
    {:map_location_id => '3',:status => 'Available',},
    {:map_location_id => '4',:status => 'Available',},
    {:map_location_id => '5',:status => 'Available',},
    {:map_location_id => '6',:status => 'Available',},
    {:map_location_id => '7',:status => 'Available',},
    {:map_location_id => '8',:status => 'Available',},
    {:map_location_id => '9',:status => 'Available',},
    {:map_location_id => '10',:status => 'Available',},
    {:map_location_id => '11',:status => 'Available',},
    {:map_location_id => '12',:status => 'Available',},
    {:map_location_id => '13',:status => 'Available',},
    {:map_location_id => '14',:status => 'Available',},
    {:map_location_id => '15',:status => 'Available',},
    {:map_location_id => '16',:status => 'Available',},
    {:map_location_id => '17',:status => 'Available',},
    {:map_location_id => '18',:status => 'Available',},
    {:map_location_id => '19',:status => 'Available',},
    {:map_location_id => '20',:status => 'Available',},
    {:map_location_id => '21',:status => 'Available',},
    {:map_location_id => '22',:status => 'Available',},
    {:map_location_id => '23',:status => 'Available',},
    {:map_location_id => '24',:status => 'Available',},
    {:map_location_id => '25',:status => 'Available',},
    {:map_location_id => '26',:status => 'Available',},
    {:map_location_id => '27',:status => 'Available',},
    {:map_location_id => '28',:status => 'Available',},
    {:map_location_id => '29',:status => 'Available',},
    {:map_location_id => '30',:status => 'Available',},
    {:map_location_id => '31',:status => 'Available',},
    {:map_location_id => '32',:status => 'Available',},
]
  roomdetails.each do |hash|
    roomdetail = Roomdetailmap.new
    hash.each do |attribute, value|
      roomdetail.update_attribute(attribute, value)
    end
  end


userseeds =
[

    {:name => 'Default Owner',:dateofbirth => '16/09/1960',
     :gender => 'male',:department_id => '1',
     :address => 'LUMS',:contactnumber => '+9242356789',
     :email => 'defaultowner@lums.edu.pk'},
]

userseeds.each do |hash|
    userseed = User.new
    hash.each do |attribute, value|
      userseed.update_attribute(attribute, value)
    end
end

owners =
[

    {:user_id => '1',:faculty_member_designation_type_id => '1',
     :biography => '',:academicrecords => '', :researchinterests => '',
     :jobexperiences => ''},
]

owners.each do |hash|
    owner = FacultyMember.new
    hash.each do |attribute, value|
      owner.update_attribute(attribute, value)
    end
end


statusinvs =
[
    {:inventorystatus => 'Allocated',},
    {:inventorystatus => 'Faulty',},
    {:inventorystatus => 'In store',},
    {:inventorystatus => 'In store faulty',},
    {:inventorystatus => 'Obsolete',},
]

statusinvs.each do |hash|
    statusinv = InventoryStatus.new
    hash.each do |attribute, value|
      statusinv.update_attribute(attribute, value)
    end
end