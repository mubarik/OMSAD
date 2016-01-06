require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  fixtures :students
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @student = students(:data1)
  end

  test "should not save student without rollno" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => students(:data2).rollno, :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student without rollno"
  end

  test "should not save student if rollno is not numeric" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "cs11030038", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but rollno is not numeric type"
  end

  test "should not save student if rollno is already exists" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => @student.rollno, :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but rollno is already exists"
  end

  test "should not save student if rollno is not equal 8 didits long" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "1103003889", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but rollno is not equal 8 didits long"
  end

  test "should not save student if credithrstaken is not numeric" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => "eighteen", :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but credithrstaken is not numeric type"
  end

  test "should not save student if credithrstaken is greater than 2 digits" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => 225, :financialaidstatus => @student.financialaidstatus,
        :cgpa => @student.cgpa, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but credithrstaken is greater than 2 digits"
  end

  test "should not save student if cgpa is greater than 4 digits" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => "3.69989", :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but cgpa is greater than 4 digits"
  end

  test "should not save student if cgpa is not numeric" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => "three.5", :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but cgpa is not numeric type"
  end

  test "should not save student if cgpa is greater than 4" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => 5, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but cgpa is greater than 4"
  end

  test "should not save student if cgpa is less than 0" do
    student = Student.create(:user_id => @student.user_id, :department_id => @student.department_id,
        :rollno => "11030039", :credithrstaken => @student.credithrstaken, :financialaidstatus => @student.financialaidstatus,
        :cgpa => -5, :degreelevel => @student.degreelevel, :probationstatus => @student.probationstatus,
        :degreetype => @student.degreetype, :degreestatus => @student.degreestatus, :currentsemester => @student.currentsemester,
        :admissiondate => @student.admissiondate, :graduationdate => @student.graduationdate)
    assert !student.save, "Saved the student but cgpa is less than 0"
  end

  def test_associations
    assert_working_associations
  end
  
  # called after every single test
  def teardown
    # as we are re-initializing @student before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @student = nil
  end
end
