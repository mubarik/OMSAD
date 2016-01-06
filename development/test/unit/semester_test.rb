require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  fixtures :semesters
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @semester = semesters(:data1)
  end

  test "should not save semester info if same semester id being offered in same year" do
    semester = Semester.new(:offering => @semester.offering , :year => @semester.year)
    assert !semester.save, "Saved the semester info but same semester in same year is already being offered"
  end

  def test_associations
    assert_working_associations
  end
  # called after every single test
  def teardown
    # as we are re-initializing @course before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @semester = nil
  end
end
