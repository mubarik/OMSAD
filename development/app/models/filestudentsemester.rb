class Filestudentsemester < ActiveRecord::Base
   def self.importcourse(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
       c=Filestudentsemester.new
       c.studentid   =row[0]
       c.offering    =row[1]
       c.year        =row[2]
       c.coursecode  =row[3]
       c.coursename  =row[4]
       c.gpa         =row[5]
       c.grade       =row[6]
       c.status      =row[7]


        if c.save
        #n=n+1
        GC.start if n%50==0
        end

      end
      Filestudentsemester.studentsave

      return n
  end

   def self.studentsave

      @studentsemester = Filestudentsemester.all
      (@studentsemester).each do |s|

       @student = Student.find_by_rollno(s.studentid)
       if !@student.blank?
       @grade = GradeType.find_by_name(s.grade)
       if @grade.nil?
          @grade = GradeType.create(:name => s.grade, :project_conf_id => 1 )
       end
       @status = CourseStatus.find_by_name(s.status)
       if @status.nil?
          @status = CourseStatus.create(:name => s.status, :project_conf_id => 1 )
       end
       @semester = Semester.find_by_offering_and_year(s.offering,s.year)
       if @semester.nil?
       @semester =   Semester.create(:offering => s.offering, :year => s.year)
       @semester = Semester.find_by_offering_and_year(s.offering,s.year)
       end
       @course = Course.find_by_coursecode(s.coursecode)
       if @course.nil?
       @course =  Course.create(:coursecode => s.coursecode, :coursename => s.coursename)
       @course = Course.find_by_coursecode(s.coursecode)
       end
       @ss = StudentSemester.find_by_semester_id_and_student_id(@semester.id,@student.id)
        if @ss.nil?
       StudentSemester.create(:student_id => @student.id, :semester_id => @semester.id)
       end
       @sc = StudentCourse.find_by_student_id_and_semester_id_and_course_id(@student.id, @semester.id, @course.id )    
       if @sc.nil?
       StudentCourse.create(:student_id => @student.id, :semester_id => @semester.id,:course_id => @course.id,
         :coursegpa => s.gpa ,:grade_type_id => @grade.id, :course_status_id => @status.id )
       end
       end
      end
    end

end









