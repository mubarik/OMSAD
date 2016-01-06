class FacultyCourse < ActiveRecord::Base
  belongs_to :faculty_member
  belongs_to :semester
  belongs_to :course

  def self.courses
    SemesterCourse.joins(:course).where("semester_courses.course_id = courses.id")

  end

  def self.get_semester_courses(faculty_id,semester_id)
    @faculty_added_courses = FacultyCourse.select(:course_id).where(:semester_id => semester_id, :faculty_member_id => faculty_id)

    @faculty_courses = Array.new
    @faculty_courses.push(0)
    @faculty_added_courses.each do |semester_course|
      @faculty_courses.push(semester_course.course_id)
    end
    @semestercourses = SemesterCourse.find(:all, :conditions => ["semester_id =? AND course_id NOT IN (?)", semester_id, @faculty_courses])
    return @semestercourses
  end

  def semester1
    "#{semester.offering}"" #{semester.year}"
  end

  def self.faculty_courses_report(faculty_id, year)
    
    FacultyCourse.joins(:semester).where("semesters.year LIKE '%%" + year +"%%'  and faculty_courses.faculty_member_id = "+ faculty_id,
                                          :include => [:semester,:course])
  end
end
