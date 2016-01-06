require 'test_helper'



class PublicationTest < ActiveSupport::TestCase


 fixtures :publications
 def setup
    @publicationnil = publications(:datanil)
    @publicationSpcharacter = publications(:dataSpecialChars)
    @publicationCorrectEntry = publications(:dataCorrectEntry)
    @publicationNumeric = publications(:dataNumeric)
    @publicationNumericwithalpha = publications(:dataNumericwithalpha)

 end

    test "Should not save publication without title of publication" do
    publication = Publication.new( :title=>nil , :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "Should not save publication without title of publication"
  end


      test "Should not save publication with tiltle having special characters" do
    publication = Publication.new( :title=>@publicationSpcharacter.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear  ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "Should not save publication with tiltle having special characters"
  end



       test "Should not save publication without publication year" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>nil ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi)

    assert !publication.save, "Should not save publication without publication year"
  end





    test "Should not save publication with publication year not is proper format" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>20045 ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi)

    assert !publication.save, "Should not save publication with publication year not is proper format"
  end


    test "Should not save publication with publication year not is proper format test 2" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationSpcharacter.publicationyear ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi)

    assert !publication.save, "Should not save publication with publication year not is proper format"
  end



      test "Should not save publication with publication year is not in proper format test 3" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=>  @publicationCorrectEntry.abstract,
                                 :publicationyear =>"leepyear" ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "Should not save publication with publication year not in proper format"
  end


   test "should not save publication with invalid publication status" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear ,
                                 :publicationstatus =>@publicationSpcharacter.publicationstatus ,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "should not save publication with invalid publication status"
  end


    test "should not save publication with invalid publication status test 2" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear ,
                                 :publicationstatus =>"Submittedsddfsdfsdf",
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "should not save publication with invalid publication status"
  end



    test "should not save publication with invalid publication status test 3" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear ,
                                 :publicationstatus =>@publicationNumericwithalpha.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords ,
                                 :doi =>@publicationCorrectEntry.doi )

    assert !publication.save, "should not save publication with invalid publication status"
  end




    test "Valid URL format should be used in DOI filed" do
    publication = Publication.new( :title=>@publicationCorrectEntry.title, :abstract=> @publicationCorrectEntry.abstract,
                                 :publicationyear =>@publicationCorrectEntry.publicationyear ,
                                 :publicationstatus =>@publicationCorrectEntry.publicationstatus,
                                 :keywords=> @publicationCorrectEntry.keywords,
                                 :doi =>"dfsdgfdfgfdsgdfg" )

    assert !publication.save, "Valid URL format should be used in DOI filed"
  end


  def test_associations
    assert_working_associations
  end







end
