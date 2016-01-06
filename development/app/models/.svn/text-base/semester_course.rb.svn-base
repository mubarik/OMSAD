class SemesterCourse < ActiveRecord::Base
  belongs_to :semester
  belongs_to :course

  validates :semester_id, :uniqueness => {:scope => [:course_id], :message => 'Course is already added to this semester'}


  def c_name
    course.coursename
  end

  def c_id
    course.id
  end
  def self.del_courses_from_semester()
  end
end
