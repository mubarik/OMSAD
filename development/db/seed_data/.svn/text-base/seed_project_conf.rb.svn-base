# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project_conf_types =
[
    {
      :id   => '1',      
    }
]
ProjectConf.delete_all
project_conf_types.each do |hash|
  project_conf_type = ProjectConf.new
    hash.each do |attribute, value|
      project_conf_type.update_attribute(attribute, value)
    end
end