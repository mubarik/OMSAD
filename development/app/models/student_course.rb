class StudentCourse < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  belongs_to :semester
  has_many :course_assets
  belongs_to :grade_type
  belongs_to :course_status
  accepts_nested_attributes_for :course_assets , :allow_destroy =>true

  validates :student_id, :uniqueness => {:scope => [:course_id,:semester_id], :message => 'Student has already taken this course in selected semester'}
  validates :course_id, :numericality => {:greater_than => 0, :message => "Must be greater than 0"}

    def self.grades(grade)
      if grade == 'A+'
        return '4'
      elsif grade == 'A'
        return '4'
      elsif grade == 'A-'
        return '3.7'
      elsif grade == 'B+'
        return '3.33'
      elsif grade == 'B'
        return '3'
      elsif grade == 'B-'
        return '2.7'
      elsif grade == 'C+'
        return '2.33'
      elsif grade == 'C'
        return '2'
      elsif grade == 'C-'
        return '1.7'
      elsif grade == 'D'
        return '1'
      elsif grade == 'F'
        return '0'
      elsif grade == 'Ungraded'
        return '0'
      end
    end

  def coursegrade
    if !grade_type.blank? or !grade_type.nil?
      return grade_type.name
    end
    return "Not Provided"
  end

  def coursestatus
    if !course_status.blank? or !course_status.nil?
      return course_status.name
    end
    return "Not Provided"
  end
  def c_name
    course.coursename
  end
  def c_id
    course.id
  end

  def self.get_courses(studentid,semesterid)
    @studenttakencourses = StudentCourse.select(:course_id).where(:student_id=>studentid,:semester_id=>semesterid)
    @student_courses = Array.new
    @student_courses.push(0)
    @studenttakencourses.each do|course|
      @student_courses.push(course.course_id)
    end
    @semestercourses = SemesterCourse.find(:all, :conditions => ["semester_id =? AND course_id NOT IN (?)", semesterid,@student_courses])
    return @semestercourses
  end

  def self.get_semesters(studentid)
    @semesters_already_added = StudentSemester.select(:semester_id).where(:student_id=>studentid)
    @semesters_array = Array.new
    @semesters_array.push(0)
    @semesters_already_added.each do|semester|
      @semesters_array.push(semester.semester_id)
    end
    @semestersoffered = Semester.find(:all, :conditions => ["id NOT IN (?)", @semesters_array])
    return @semestersoffered
  end

end