require 'test_helper'

class ResearchGrantTest < ActiveSupport::TestCase

   fixtures :research_grants
 def setup
    @researchgrantCorrectEntry = research_grants(:dataCorrectEntry)

 end


    test "should not save user without user name" do
    researchGrant = ResearchGrant.new( :title=>nil, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Saved the research Grant without grant title name"
  end



    test "Grant title should not contain special characters" do
    researchGrant = ResearchGrant.new( :title=>"!!@@@$$", :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Grant title contains spectial characters"
  end



      test "Grant number should not contain alphbets" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> "ssdfsdf",
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Grant number should not contain alphbets"
  end




    test "Grant number should not contain special characters" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> "!!!@@@$$",
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Grant number should not contain special characters"
  end


    test "Grant number should contain Digits only" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> "1234",
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert researchGrant.save, "Grant number should contain Digits only"
  end




      test "Faculty member id is required" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>nil,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Faculty member id is required"
  end



        test "Funding agency is requied field" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>nil,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Funding agency is requied field"
  end



          test "Amount should be in proper format" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>"#25257257",
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Amount should be in proper format"
  end



    test "Amount should be in proper format test 2" do
   researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.startdate ,
                                 :enddate =>@researchgrantCorrectEntry.enddate,
                                 :amount =>"25257257fsdfsdf",
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Amount should be in proper format"
  end


    test "Should not save research grant if start date is earlier then end date" do
    researchGrant = ResearchGrant.new( :title=>@researchgrantCorrectEntry.title, :grantnumber=> @researchgrantCorrectEntry.grantnumber,
                                 :description =>@researchgrantCorrectEntry.description ,
                                 :fundingagency =>@researchgrantCorrectEntry.fundingagency,
                                 :startdate=> @researchgrantCorrectEntry.enddate ,
                                 :enddate =>@researchgrantCorrectEntry.startdate,
                                 :amount =>@researchgrantCorrectEntry.amount,
                                 :faculty_member_id=>@researchgrantCorrectEntry.faculty_member_id,
                                  :partners=>@researchgrantCorrectEntry.partners,
                                   :team =>@researchgrantCorrectEntry.team)
    assert !researchGrant.save, "Should not save research grant if start date is earlier then end date"
  end





  def test_associations
    assert_working_associations
  end





 
end
