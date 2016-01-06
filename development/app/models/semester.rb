class Semester < ActiveRecord::Base
  require 'csv'
  has_many :StudentSemester,:dependent => :destroy
  has_many :students, :through => :StudentSemester
  has_many :SemesterCourse, :dependent => :destroy
  has_many :courses, :through => :SemesterCourse
  has_many :StudentCourses, :dependent => :destroy
  accepts_nested_attributes_for :SemesterCourse, :allow_destroy => true

  # association for faculty courses
  has_many :faculty_courses, :dependent => :destroy
  has_many :faculty_members, :through => :faculty_courses

  # association for TA courses
  has_many :ta_courses, :dependent => :destroy
  has_many :users, :through => :ta_courses

  validates :offering, :uniqueness => {:scope => :year , :message => "Semester already created"}


  def semester_name
    "#{self.offering}"" #{self.year}"
  end

 def self.importsemester(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
       @semester = Semester.find_by_offering_and_year(row[0],row[1])
       if @semester.blank?
       c=Semester.new
       c.offering   =row[0]
       c.year     =row[1]

        if c.save
        #n=n+1
        GC.start if n%50==0
        end
      
      end
     end
      return n
  end

end