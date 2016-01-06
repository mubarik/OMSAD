class Student < ActiveRecord::Base
  #has_one :FinancialAid, :dependent => :destroy
  has_many :StudentCourse, :dependent => :destroy
  has_many :courses ,:through =>:StudentCourse
  has_many :StudentSemester, :dependent => :destroy
  has_many :semesters ,:through =>:StudentSemester
  belongs_to :user
  has_one :milestone, :dependent => :destroy
  has_one :ms_course, :dependent => :destroy
  has_many :independent_studies, :dependent => :destroy
  
  #Probation Status Association
  belongs_to :probation_status_type,
             :foreign_key=>'student_probation_status_type_id',
             :class_name=>'StudentProbationStatusType'
  #Degree Status Association
  belongs_to :degree_status_type,
             :foreign_key=>'student_degree_status_type_id',
             :class_name=>'StudentDegreeStatusType'

  accepts_nested_attributes_for :StudentCourse, :allow_destroy => true
  accepts_nested_attributes_for :StudentSemester, :allow_destroy => true
  accepts_nested_attributes_for :independent_studies, 
    :reject_if=> lambda{|a| a[:studytitle].blank? or a[:studycode].blank?},
    :allow_destroy => true
  #accepts_nested_attributes_for :FinancialAid, :allow_destroy => true
  #accepts_nested_attributes_for :milestone, :allow_destroy => true

  validates :rollno , :presence => { :message => "Roll number is required" } , :numericality => {:greater_than => 0}, :uniqueness => {:message => " Roll number already exists"}, :length=>{:is => 8 , :message => 'Should be 8 digits in length'}
  validates :credithrstaken, :allow_nil => true ,:length=>{:maximum => 2}, :numericality => {:greater_than => 0}
  validates :cgpa, :numericality =>{:greater_than => -0.0000001, :less_than => 4.0001, :message => "Must be between 0 and 4.0"} , :allow_nil => true,  :length => {:maximum => 4, :message => "GPA must have 2 decimal digits"}
  #validate :admission_date , :on => :create

#  def admission_date
#    if self.admissiondate.nil? and self.graduationdate.nil?
#
#    elsif self.graduationdate.nil?
#    elsif self.admissiondate.nil?
#    else
#      self.admissiondate   >  self.graduationdate or self.admissiondate   ==  self.graduationdate
#      errors.add(:admissiondate, 'Admission Date Must Be Earlier Than graduation date')
#    end
#  end

#  def degreelevel
#    if !degree_level_type.blank?
#      return degree_level_type.name
#    end
#    return "Not Provided"
#  end

  def probationstatus
    if !probation_status_type.blank?
      return probation_status_type.name
    end
    return "Not Provided"
  end

  def degreestatus
    if !degree_status_type.blank?
      return degree_status_type.name
    end
    return "Not Provided"
  end

  def self.create_student(user_id,department_id,rollno,credithrstaken,financialaidstatus,cgpa,degreelevel,probationstatus,degreetype,degreestatus,currentsemester,admissiondate,graduationdate)
    student = Student.create(:user_id => user_id, :department_id => department_id, :rollno => rollno, :credithrstaken => credithrstaken, :financialaidstatus => financialaidstatus, :cgpa => cgpa, :degreelevel => degreelevel, :probationstatus => probationstatus, :degreetype => degreetype, :degreestatus => degreestatus, :currentsemester => currentsemester, :admissiondate => admissiondate, :graduationdate => graduationdate)
    return student
  end
  
  def self.all_wrappers
    students = Student.all
    students_wrappers = Array.new
    imgclass = 'profilePicture'
    students.each do|student|
      if !student.user.photo_file_name.nil?
        imgsrc = student.user.photo
      else
        imgsrc = 'user.png'
      end
      students_wrapper = IndexWrapper.new( student.user_id,
                                               imgclass,
                                               imgsrc,
                                               student.user.name,
                                               'Roll No',student.rollno,
                                               'CGPA',student.cgpa,
                                               'Degree',student.degreelevel,
                                               'Email',student.user.email,
                                               'GraduateStudents/students')

      students_wrappers.push(students_wrapper)
    end
    return students_wrappers.reverse
  end
end
