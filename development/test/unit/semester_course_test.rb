require 'test_helper'

class SemesterCourseTest < ActiveSupport::TestCase
  fixtures :semester_courses
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @semestercourse = semester_courses(:data1)
  end

  def test_associations
    assert_working_associations
  end

  test "should not save course in semester if same course in that semester is already exists" do
    semestercourse = SemesterCourse.new(:semester_id => @semestercourse.semester_id,:course_id => @semestercourse.course_id, :prerequisite => @semestercourse.prerequisite)
    assert !semestercourse.save, "Saved the semester same course is already exists"
  end

  # called after every single test
  def teardown
    # as we are re-initializing @semestercourse before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @semestercourse = nil
  end
end
