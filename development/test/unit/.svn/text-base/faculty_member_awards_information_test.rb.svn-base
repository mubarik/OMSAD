# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'
class FacultyMemberAwardsInformationTest < ActiveSupport::TestCase
  fixtures :faculty_member_awards_informations
 def setup
    @award_information_CorrectEntry = faculty_member_awards_informations(:dataCorrectEntry)
  end

 def test_associations
    assert_working_associations
  end


   test "Should save award information" do
    award_info = FacultyMemberAwardsInformation.new(:title => @award_information_CorrectEntry.title )

     assert award_info.save, "Award information not saved."
  end
end
