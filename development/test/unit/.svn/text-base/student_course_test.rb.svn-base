require 'test_helper'

class StudentCourseTest < ActiveSupport::TestCase
  fixtures :student_courses
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @studentcourse = student_courses(:data1)
  end

  test "should not enroll student in course in a semester if student is already taking that course in that semester" do
    studentcourse = StudentCourse.new(:student_id => @studentcourse.student_id,:course_id => @studentcourse.course_id, :semester_id => @studentcourse.semester_id ,:coursegpa => @studentcourse.coursegpa, :coursegrade => @studentcourse.coursegrade, :coursestatus => @studentcourse.coursestatus)
    assert !studentcourse.save, "Enrolling the student in course in a semester but student is already taking that course in this semesters"
  end

  def test_associations
    assert_working_associations
  end
  # called after every single test
  def teardown
    # as we are re-initializing @studentcourse before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @studentcourse = nil
  end
end
