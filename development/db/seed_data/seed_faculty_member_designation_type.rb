# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

designation_types =
[
    {
      :id   => '1',
      :name => 'Visiting Faculty'
    },
    {
      :id  => '2',
      :name => 'Adjunct Faculty'
    },

    {
      :id   => '3',
      :name => 'Teaching Fellow'
    },

    {
      :id   => '4',
      :name =>'Research Fellow'
    },
    {
      :id   => '5',
      :name =>'Assistant Professor'
    },
    {
      :id   => '6',
      :name =>'Visiting Assistant Professor'
    },
    {
      :id   => '7',
      :name =>'Professor'
    },
    {
      :id   => '8',
      :name =>'Visiting Professor'
    },
    {
      :id   => '9',
      :name =>'Associate Professor'
    },
    {
      :id   => '10',
      :name =>'Visiting Associate Professor',
    }

]

designation_types.each do |hash|
  designation_type = FacultyMemberDesignationType.new
    hash.each do |attribute, value|
      designation_type.update_attribute(attribute, value)
    end
end