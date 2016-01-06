# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

status_types =
[
    {
      :id=>'1',:name => 'Active'
    },
    {
      :id=>'2',:name => 'On Sabbatical'
    },

    {
      :id=>'3',:name => 'On Leave'
    },

    {
      :id=>'4',:name =>'Left'
    }

]
FacultyMemberStatusType.delete_all
status_types.each do |hash|
    status_type = FacultyMemberStatusType.new
    hash.each do |attribute, value|
      status_type.update_attribute(attribute, value)
    end
end