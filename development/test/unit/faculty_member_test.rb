require 'test_helper'

class FacultyMemberTest < ActiveSupport::TestCase
 fixtures :faculty_members
 def setup
    @facultymemberCorrectEntry = faculty_members(:dataCorrectEntry)
   
 end

    test "should not save faculty member without deignation" do
    faculty_member = FacultyMember.new( :user_id=>@facultymemberCorrectEntry.user_id, :designation=> nil,
                                 :biography =>@facultymemberCorrectEntry.biography ,
                                 :awardsinfo =>@facultymemberCorrectEntry.awardsinfo,
                                 :academicrecords => @facultymemberCorrectEntry.academicrecords,
                                 :researchinterests=>@facultymemberCorrectEntry.researchinterests,
                                 :jobexperiences=>@facultymemberCorrectEntry.jobexperiences  )
    assert !faculty_member.save, " Designation feild should be entered "
  end



   test "Digits are not allowed in designation field" do
    faculty_member = FacultyMember.new( :user_id=>@facultymemberCorrectEntry.user_id, :designation=> "Professor 45222",
                                 :biography =>@facultymemberCorrectEntry.biography ,
                                 :awardsinfo =>@facultymemberCorrectEntry.awardsinfo,
                                 :academicrecords => @facultymemberCorrectEntry.academicrecords,
                                 :researchinterests=>@facultymemberCorrectEntry.researchinterests,
                                 :jobexperiences=>@facultymemberCorrectEntry.jobexperiences  )
    assert !faculty_member.save, " Digits are not allowed in designation field"
  end



   test "special characters are not allowed in designation field" do
    faculty_member = FacultyMember.new( :user_id=>@facultymemberCorrectEntry.user_id, :designation=> "@@@@&&&& Professor",
                                 :biography =>@facultymemberCorrectEntry.biography ,
                                 :awardsinfo =>@facultymemberCorrectEntry.awardsinfo,
                                 :academicrecords => @facultymemberCorrectEntry.academicrecords,
                                 :researchinterests=>@facultymemberCorrectEntry.researchinterests,
                                 :jobexperiences=>@facultymemberCorrectEntry.jobexperiences  )
    assert !faculty_member.save, " special characters are not allowed in designation field"
  end


   def test_associations
    assert_working_associations
  end




end
