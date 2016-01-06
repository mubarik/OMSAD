require 'test_helper'

class ConferencePublicationTest < ActiveSupport::TestCase


  fixtures :conference_publications
 def setup
    @ConferencePublicationCorrectEntry = conference_publications(:dataCorrectEntry)
    @ConferencePublicationalphabets = conference_publications(:dataalphabets)
    @ConferencePublicationspecialcharacters = conference_publications(:dataSpecialCharacters)
    @ConferenceinvalidUrl = conference_publications(:dataInvalidformatUrl)

  end


    test "Conference publication should no saved without conference name" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>nil,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.city               )

    assert !publication_conference.save, "Conference publication should not be saved without conference name"
  end



    test "Conference publication should no saved with conference name having special characters" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationspecialcharacters.conferencename,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.city               )

    assert !publication_conference.save, "Conference publication should not be saved with conference name having special characters"
  end


    test "Conference publication should no saved with website having invalid format" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => @ConferenceinvalidUrl.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate   ,
                                          :city => @ConferencePublicationCorrectEntry.city               )

    assert !publication_conference.save, "Conference publication should no saved with website having invalid format"
  end



    test "Conference publication should no saved without website" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => nil,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate   ,
                                          :city => @ConferencePublicationCorrectEntry.city                )

    assert !publication_conference.save, "Conference publication should no saved without website"
  end




    test "Conference publication should not saved with invalid entry in acceptance rate" do
    publication_conference = ConferencePublication.new( :publication_id=> @ConferencePublicationCorrectEntry.publication_id,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate  ,
                                          :acceptancerate =>@ConferencePublicationalphabets.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.website )

    assert !publication_conference.save, "Conference publication should no saved with invalid entry in acceptance rate"
  end




    test "Conference publication should no saved with invalid entry in acceptance rate test 2" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationspecialcharacters.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.city )

    assert !publication_conference.save, "Conference publication should no saved with invalid entry in acceptance rate test 2"
  end




      test "Conference publication should no saved with invalid entry in rank" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationspecialcharacters.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferencestartdate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferenceenddate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.city )

    assert !publication_conference.save, "Conference publication should no saved with invalid entry in rank"
  end



    test "Conference publication should no saved if end date is earlier then start date" do
    publication_conference = ConferencePublication.new( :publication_id=>@ConferencePublicationCorrectEntry.publication_id ,
                                          :conferencename=>@ConferencePublicationCorrectEntry.conferencename,
                                          :website => @ConferencePublicationCorrectEntry.website,
                                          :rank =>@ConferencePublicationCorrectEntry.rank,
                                          :conferencestartdate =>@ConferencePublicationCorrectEntry.conferenceenddate,
                                          :conferenceenddate => @ConferencePublicationCorrectEntry.conferencestartdate ,
                                          :acceptancerate => @ConferencePublicationCorrectEntry.acceptancerate  ,
                                          :city => @ConferencePublicationCorrectEntry.city )

    assert !publication_conference.save, "Conference publication should no saved if end date is earlier then start date"
  end



  def test_associations
    assert_working_associations
  end






end
