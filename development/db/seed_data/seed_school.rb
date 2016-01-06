schools =
[
    {:id=>'1',:name => 'School of Science and Engineering'}
]
School.delete_all
schools.each do |hash|
    school = School.new
    hash.each do |attribute, value|
      school.update_attribute(attribute, value)
    end
end

#departments =
#[
#    {:id=>'1',:school_id => '1',:name => 'Computer Science',:description => 'Computer Science department'},
#    {:id=>'2',:school_id => '1',:name => 'Electrical Engineering',:description => 'Computer Engineering department'},
#]
#Department.delete_all
#departments.each do |hash|
#    department = Department.new
#    hash.each do |attribute, value|
#     department.update_attribute(attribute, value)
#    end
#end