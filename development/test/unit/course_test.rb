require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  fixtures :courses
  # test "the truth" do
  #   assert true
  # end

  # called before every single test
  def setup
    @course = courses(:data1)
  end

  #course = Course.new(:coursetype =>@course.coursetype,:coursename=>@course.coursename,:coursecode=>@course.coursecode,:credithrs=>@course.credithrs)
  #course = Course.new(:coursetype =>nil,:coursename=>nil,:coursecode=>nil,:credithrs=>nil)

  test "should not save course without course data" do
    course = Course.new(:coursetype => courses(:data2).coursetype,:coursename => courses(:data2).coursename,:coursecode => courses(:data2).coursecode,:credithrs => courses(:data2).credithrs)
    assert !course.save, "Saved the course without course data"
  end

  test "should not save course without course name" do
    course = Course.new(:coursetype =>"regular",:coursename => courses(:data2).coursename,:coursecode=>"CS551",:credithrs=>"3")
    assert !course.save, "Saved the course without course name"
  end

  test "should not save course without course code" do
    course = Course.new(:coursetype => @course.coursetype,:coursename=> "OOP",:coursecode => courses(:data2).coursecode,:credithrs => @course.credithrs)
    assert !course.save, "Saved the course without course code"
  end

  test "should not save course without course credit hours" do
    course = Course.new(:coursetype => "reqular",:coursename => "OOP",:coursecode => "CS551",:credithrs => nil)
    assert !course.save, "Saved the course without course credit hours"
  end

#  test "should not save course without course type" do
#    course = Course.new(:coursetype => courses(:data2).coursetype,:coursename => "OOP",:coursecode => "CS551",:credithrs => @course.credithrs)
#    assert !course.save, course.errors.inspect
#  end

  test "should not save course if course name is already exists" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => @course.coursename,:coursecode => "CS551",:credithrs => @course.credithrs)
    assert !course.save, "Saved the course but course name is already exists"
  end

  test "should not save course if course code is already exists" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => "OOP",:coursecode => @course.coursecode,:credithrs => @course.credithrs)
    assert !course.save, "Saved the course but course code is already exists"
  end

  test "should not save course and for uniqueness do not need to consider case-sesitivity of course code and course name" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => "DSSD",:coursecode => "cs500",:credithrs => @course.credithrs)
    assert !course.save, "Saved the course becasue case senstivity is under consideration"
  end

  test "should not save course if course name posses special characters" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => "-*DSSD*-",:coursecode => "CS551",:credithrs => @course.credithrs)
    assert !course.save, "Saved the course but course name posses special charaters"
  end

  test "should not save course if course code is greater than 7" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => "OOP",:coursecode => "cs500897589",:credithrs => @course.credithrs)
    assert !course.save, "Saved the course but course code is grater than 7 charaters"
  end


  test "should not save course if course credit hour is less than zero" do
    course = Course.new(:coursetype => @course.coursetype,:coursename => "OOP",:coursecode => "CS551",:credithrs => -1)
    assert !course.save, "Saved the course but course credit hour is less than 0"
  end

  def test_associations
    assert_working_associations
  end

  # called after every single test
  def teardown
    # as we are re-initializing @course before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @course = nil
  end
end
