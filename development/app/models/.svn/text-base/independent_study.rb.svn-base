class IndependentStudy < ActiveRecord::Base
  belongs_to :student
  belongs_to :faculty_member
  belongs_to :student_semester
  has_many :cosupervisors, :dependent => :destroy,:before_add => :set_nest
  #Grade Type Association
  belongs_to :grade_type
  
  accepts_nested_attributes_for :cosupervisors,
    :reject_if=> lambda{|a| a[:cosupervisorname].blank? and a[:faculty_member_id].blank?},
    :allow_destroy => true
  validates :studytitle, :format => { :with => /^[a-zA-Z\s\d]+$/}, :length=>{:maximum => 250}

  def studygrade
    if !grade_type.blank?
      return grade_type.name
    end
    return "Not Provided"
  end
  def semester_name
    "#{self.semester.offering}"" #{self.semester.year}"
  end
  
  def set_nest(cosupervisor)
    cosupervisor.independent_study ||= self
  end

  def self.importstudy(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
        
          c=IndependentStudy.new
          @students = Student.find_by_rollno(row[0])
          c.student_id = @students.id
          c.studytitle = row[1]
          c.studycode = row[2]
          c.studycredithrs = row[3]
          @semester1 = Semester.find_by_offering_and_year(row[4], row[5])
          @studentsemester = StudentSemester.find_by_semester_id(@semester1.id)
          c.student_semester_id = @studentsemester.id
          @grade = GradeType.find_by_name(row[6])
          c.grade_type_id = @grade.id
          @user = User.find_by_name(row[7])
          @faculty = FacultyMember.find_by_user_id(@user.id)
          c.faculty_member_id =  @faculty.id
         
            if c.save
            #n=n+1
            GC.start if n%50==0
            end

          end
    
      return n
   end
end
