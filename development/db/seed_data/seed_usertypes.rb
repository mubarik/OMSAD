usertypes =
[
    {:typename => 'Faculty', :description => 'Faculty members'},
    {:typename => 'Graduate Students', :description => 'Students'},
]

usertypes.each do |hash|
    usertype = UserType.new
    hash.each do |attribute, value|
      usertype.update_attribute(attribute, value)
    end
end