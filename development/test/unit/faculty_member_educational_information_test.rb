# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'
class FacultyMemberEducationalInformationTest < ActiveSupport::TestCase
  
  fixtures :faculty_member_educational_informations
 def setup
    @educational_info_CorrectEntry = faculty_member_educational_informations(:dataCorrectEntry)
#    @useralphabets = workshop_publications(:dataalphabets)
#    @userspecialcharacters = workshop_publications(:dataSpecialCharacters)
#    @userinvalidUrl = workshop_publications(:dataInvalidformatUrl)

  end



  def test_associations
    assert_working_associations
  end


   test "Should save educational information" do
    educational_info = FacultyMemberEducationalInformation.new(:degree => @educational_info_CorrectEntry.degree,
                                                                              :university => @educational_info_CorrectEntry.university,
                                                                              :year => @educational_info_CorrectEntry.year)

     assert educational_info.save, "Educational information not saved."
  end
end
