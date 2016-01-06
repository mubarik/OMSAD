class Course < ActiveRecord::Base
  #has_many :prerequisites
  has_many :StudentCourse, :dependent => :destroy
  has_many :students, :through => :StudentCourse
  has_many :SemesterCourse, :dependent => :destroy
  has_many :semesters, :through => :SemesterCourse
  accepts_nested_attributes_for :SemesterCourse, :allow_destroy => true

  # association for faculty courses
  has_many :faculty_courses, :dependent => :destroy
  has_many :faculty_members, :through => :faculty_courses

  # association for TA courses
  has_many :ta_courses, :dependent => :destroy
  has_many :users, :through => :ta_courses

  validates :coursename, :presence => { :message => "Course name is required" } , :format => { :with => /^[a-zA-Z ]+$/}, :uniqueness => {:case_sensitive => false, :message => " Course name already exists"}
  validates :coursecode, :presence => { :message => "Course code is required" } ,:length=>{:maximum => 7}, :uniqueness => {:case_sensitive => false, :message => " Course code already exists"}
    #:format => { :with => /^[a-zA-Z]+\d{3}$/}
  validates :credithrs, :presence => { :message => "Must provide course credit hours" }, :numericality => {:greater_than => -0.0001, :less_than => 9.001, :message => "Must be greater than 0"}, :length=>{:maximum => 2}

#  def self.create_course(coursetype,coursename,coursecode,credithrs)
#    course = Course.create(:coursetype => coursetype,:coursename => coursename,:coursecode => coursecode,:credithrs => credithrs)
#  return course
#  end
#
#  def self.delete_course(id)
#    course = Course.find_by_id(id)
#    course.destroy
#  end

  def self.all_wrappers
    courses = Course.all
    courses_wrappers = Array.new
    imgclass = 'noPicDisplay'
    imgsrc = ''
    courses.each do|course|
      courses_wrapper = IndexWrapper.new( course.id,
                                               imgclass,
                                               imgsrc,
                                               course.coursecode.to_s + ' ' + course.coursename,
                                               'Course Type',course.coursetype,
                                               'Course Credit Hours',course.credithrs,
                                               'GraduateStudents/courses')

      courses_wrappers.push(courses_wrapper)
    end
    return courses_wrappers.reverse
  end


  def self.importcourse(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
       @course = Course.find_by_coursecode(row[0])
       if @course.blank?
         c=Course.new
         c.coursecode   =row[0]
         c.coursename   =row[1]
         c.coursetype   =row[2]
         c.credithrs    =row[3]


          if c.save
          #n=n+1
          GC.start if n%50==0
          end

        end
     end
      return n
  end
end