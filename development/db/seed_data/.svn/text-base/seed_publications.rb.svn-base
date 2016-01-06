publications =
[
    {:title => 'IEEE',:abstract =>'This is an IEEE conference', :publication_type_id => '3',
     :publicationyear =>'2012', :keywords =>'IEEE'},
    {:title => 'ISociety',:abstract =>'This is an I-Society conference', :publication_type_id => '1',
     :publicationyear =>'2011', :keywords =>'I-Society'}
]

publications.each do |hash|
    publication = Publication.new
    hash.each do |attribute, value|
      publication.update_attribute(attribute, value)
    end
end

conference_publications =
[
    {:publication_id => '1',:conferencename =>'International Design Engineering Technical Conferences',
     :website => 'www.google.com',:rank =>'2', :conferencestartdate =>'20-6-2010',
     :conferenceenddate=>'20-6-2011', :city=>'London',:acceptancerate=>'20'},

]

conference_publications.each do |hash|
    conference_publication = ConferencePublication.new
    hash.each do |attribute, value|
      conference_publication.update_attribute(attribute, value)
    end
end

workshop_publications =
[
    {:publication_id => '2',:workshopname=>'Workshop on Domain Name Dispute Resolution',
     :conferencename =>'IEEE',:website => 'www.google.com',
     :workshopstartdate =>'20-6-2011',:workshopenddate=>'20-6-2012', :city=>'New York'},

]

workshop_publications.each do |hash|
    workshop_publication = WorkshopPublication.new
    hash.each do |attribute, value|
      workshop_publication.update_attribute(attribute, value)
    end
end

user_publications =
[
    {:user_id =>'1',:publication_id => '1',:authorname =>'Adil Nazir',
     :authorindex => '1', :lumsaffiliation =>'0',
     :affiliation=>'Comsat'},

    { :user_id =>'2',:publication_id => '2',:authorname =>'Mubarik Ahmad',
     :authorindex => '1', :lumsaffiliation =>'0',
     :affiliation=>'FAST'},

]

user_publications.each do |hash|
    user_publication = UserPublication.new
    hash.each do |attribute, value|
      user_publication.update_attribute(attribute, value)
    end
end
