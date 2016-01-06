publicationtypes =
[
    {:id=>'1',:name => 'Workshop Publication'},
    {:id=>'2',:name => 'Journal Publication'},
    {:id=>'3',:name => 'Conference Publication'},
    {:id=>'4',:name => 'Technical Report Publication'},
    {:id=>'5',:name => 'Book Chapter Publication'},
    {:id=>'6',:name => 'Book Publication'}
]
PublicationType.delete_all
publicationtypes.each do |hash|
    publicationtype = PublicationType.new
    hash.each do |attribute, value|
      publicationtype.update_attribute(attribute, value)
    end
end