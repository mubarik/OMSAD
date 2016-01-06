module GraduateStudents::StudentsHelper
  def courses_exsists(semester,student)
    @courses = StudentCourse.select(:id).where(:semester_id=>semester,:student_id=>student)
    if @courses.blank?
      return false
    else
      return true
    end
  end
  def thesis_or_independentstudies_exsists(studentsemester,student)
    @thesis_exists = MsCourse.find(:all,:conditions=>["student_semester1_id = (?) OR student_semester2_id = (?) AND student_id = (?)", studentsemester,studentsemester,student])
    @independent_studies_exists = IndependentStudy.select(:id).where(:student_semester_id=>studentsemester, :student_id=>student)
    if @thesis_exists.blank? and @independent_studies_exists.blank?
      return false
    else
      return true
    end
  end
end
