require 'test_helper'

class StudentSemesterTest < ActiveSupport::TestCase
  fixtures :student_semesters
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @studentsemester = student_semesters(:data1)
  end

  test "should not enroll student in a semester if student is already enrolled in that semester" do
    studentsemester = StudentSemester.new(:student_id => @studentsemester.student_id , :semester_id => @studentsemester.semester_id,:semestergpa => @studentsemester.semestergpa,:status => @studentsemester.status)
    assert !studentsemester.save, "Enrolling the student in a semester but student is already enrolled in this semester"
  end

  test "should not save semester if semester GPA is greater than 4" do
    studentsemester = StudentSemester.new(:student_id => @studentsemester.student_id , :semester_id => 2,:semestergpa => 5,:status => @studentsemester.status)
    assert !studentsemester.save, "Saved the semester but semester GPA is grater than 4."
  end

  test "should not save semester if semester GPA is less than 0" do
    studentsemester = StudentSemester.new(:student_id => @studentsemester.student_id , :semester_id => 2,:semestergpa => -5,:status => @studentsemester.status)
    assert !studentsemester.save, "Saved the semester but semester GPA is less than 0."
  end

  def test_associations
    assert_working_associations
  end
  # called after every single test
  def teardown
    # as we are re-initializing @studentsemester before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @studentsemester = nil
  end
end
