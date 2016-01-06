require 'test_helper'

class WorkshopPublicationTest < ActiveSupport::TestCase

 fixtures :workshop_publications
 def setup
    @workshopPublicationCorrectEntry = workshop_publications(:dataCorrectEntry)
    @workshopPublicationalphabets = workshop_publications(:dataalphabets)
    @workshopPublicationspecialcharacters = workshop_publications(:dataSpecialCharacters)
    @workshopinvalidUrl = workshop_publications(:dataInvalidformatUrl)

  end

  test "wokshop publication should not saved without workshopname" do
    publication_workshop = WorkshopPublication.new( :publication_id=> @workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname =>nil,
                                          :conferencename => @workshopPublicationCorrectEntry.conferencename ,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate => @workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved without workshopname"
  end



  test "wokshop publication should not saved with invalid entry in workshop name" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationspecialcharacters.workshopname,
                                          :conferencename => @workshopPublicationCorrectEntry.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate => @workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved with invalid entry in workshop name"
  end
  
  
  test "wokshop publication should saved with valid entry in workshop name" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename => @workshopPublicationCorrectEntry.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate => @workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert publication_workshop.save, "wokshop publication should saved with valid entry in workshop name"
  end






   test "wokshop publication should not saved without conference name" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename => nil,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved without workshopname"
  end



   test "wokshop publication should not saved with invalid entry in conference name" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename => @workshopPublicationspecialcharacters.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved with invalid entry in conference name"
  end


   test "wokshop publication should saved with valid entry in conference name" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename =>@workshopPublicationCorrectEntry.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert publication_workshop.save, "wokshop publication should saved with valid entry in conference name"
  end




   test "wokshop publication should saved without website" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename =>@workshopPublicationCorrectEntry.conferencename,
                                          :website=>nil,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                              )

    assert !publication_workshop.save, "wokshop publication should saved without website"
  end



   test "wokshop publication should saved with invalid entry in website" do
        publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename =>@workshopPublicationCorrectEntry.conferencename,
                                          :website=>"dfasfsdfsdf",
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               
                                                               )

    assert !publication_workshop.save, "wokshop publication should saved with invalid entry in website"
  end




   test "wokshop publication should  not saved with invalid entry in city" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename =>@workshopPublicationCorrectEntry.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :city  =>@workshopPublicationspecialcharacters.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved with invalid entry in city"
  end


    test "wokshop publication should not saved if statrt date is earlier then end date" do
    publication_workshop = WorkshopPublication.new( :publication_id=>@workshopPublicationCorrectEntry.publication_id ,
                                          :workshopname=>@workshopPublicationCorrectEntry.workshopname,
                                          :conferencename =>@workshopPublicationCorrectEntry.conferencename,
                                          :website=>@workshopPublicationCorrectEntry.website,
                                          :workshopstartdate =>@workshopPublicationCorrectEntry.workshopenddate,
                                          :workshopenddate =>@workshopPublicationCorrectEntry.workshopstartdate,
                                          :city  => @workshopPublicationCorrectEntry.city
                                                               )

    assert !publication_workshop.save, "wokshop publication should not saved if statrt date is earlier then end date"
  end






  def test_associations
    assert_working_associations
  end








end
