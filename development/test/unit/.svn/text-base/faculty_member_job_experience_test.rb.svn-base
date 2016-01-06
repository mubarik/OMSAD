# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test_helper'
class FacultyMemberJobExperienceTest < ActiveSupport::TestCase
 fixtures :faculty_member_job_experiences
 def setup
    @job_experience_CorrectEntry = faculty_member_job_experiences(:dataCorrectEntry)
  end

 def test_associations
    assert_working_associations
  end


   test "Should save job experiences" do
    job_experience = FacultyMemberJobExperience.new(:organizationname => @job_experience_CorrectEntry.organizationname,
                                                                   :from_year => @job_experience_CorrectEntry.from_year,
                                                                    :to_year => @job_experience_CorrectEntry.to_year)

     assert job_experience.save, "Job experiences not saved."
  end
end
