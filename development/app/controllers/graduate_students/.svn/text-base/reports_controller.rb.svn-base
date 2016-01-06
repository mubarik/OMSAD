class GraduateStudents::ReportsController < ApplicationController

  add_breadcrumb 'Reports', 'reports'
  
  def index
    if params[:selectreport] == "All students' details"
      @students_report_grid = initialize_grid(Student,:include => [:user,:degree_status_type], :name => 'reportAllStudents',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudents')
        export_grid_if_requested('reportAllStudents' => 'reportAllStudents') do
          render(:partial => 'graduate_students/reports/reportAllStudents',
         :locals => {:students_report_grid=>@students_report_grid},
         :layout => false)
      end
    elsif (params[:selectreport] == "All students' detailed information")
      @students_report_grid = initialize_grid(Student,:include => [:user,:probation_status_type],:name => 'reportStudentsDetail',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportStudentsDetail')
        export_grid_if_requested('reportStudentsDetail' => 'reportStudentsDetail') do
          render(:partial => 'graduate_students/reports/reportStudentsDetail',
                 :locals => {:students_report_grid=>@students_report_grid},
                 :layout => false)
      end
    elsif (params[:selectreport] == "Student's enrolled semesters")
      @student = Student.find_last_by_rollno(params[:rollno])
      if (!@student.blank?)
        @students_report_grid = initialize_grid(StudentSemester.where(:student_id=>@student.id),:include =>[:semester,:student=>[:user]], :name => 'reportStudentEnrolledSemester',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'reportStudentEnrolledSemester')
      end
      export_grid_if_requested('reportStudentEnrolledSemester' => 'reportStudentEnrolledSemester') do
          render(:partial => 'graduate_students/reports/reportStudentEnrolledSemester',
                 :locals => {:students_report_grid=>@students_report_grid},
                 :layout => false)
      end
    elsif (params[:selectreport] == "Student's enrolled courses")
      @student = Student.find_last_by_rollno(params[:rollno])
      if (!@student.blank?)
        @students_report_grid =  initialize_grid(StudentCourse.where(:student_id=>@student.id),:include =>[:grade_type,:course_status,:course,:semester,:student=>[:user]], :name => 'reportStudentEnrolledCourses',:per_page => 40, :enable_export_to_csv => true, :csv_file_name => 'reportStudentEnrolledCourses')
      end
      export_grid_if_requested('reportStudentEnrolledCourses' => 'reportStudentEnrolledCourses') do
          render(:partial => 'graduate_students/reports/reportStudentEnrolledCourses',
                 :locals => {:students_report_grid=>@students_report_grid},
                 :layout => false)
      end
    elsif (params[:selectreport] == "All students' enrolled semesters")
      @students_report_grid = initialize_grid(StudentSemester,:include =>[:semester,:student=>[:user]], :name => 'reportAllStudentsEnrolledSemesters',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsEnrolledSemesters')
      export_grid_if_requested('reportAllStudentsEnrolledSemesters' => 'reportAllStudentsEnrolledSemesters') do
          render(:partial => 'graduate_students/reports/reportAllStudentsEnrolledSemesters',
                 :locals => {:students_report_grid=>@students_report_grid},
                 :layout => false)
      end
    elsif (params[:selectreport] == "All students' enrolled courses")
      @students_report_grid =  initialize_grid(StudentCourse,:include =>[:course_status,:grade_type,:course,:semester,:student=>[:user]], :name => 'reportAllStudentsEnrolledCourses',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsEnrolledCourses')
      export_grid_if_requested('reportAllStudentsEnrolledCourses' => 'reportAllStudentsEnrolledCourses') do
        render(:partial => 'graduate_students/reports/reportAllStudentsEnrolledCourses',
               :locals => {:students_report_grid=>@students_report_grid},
               :layout => false)
      end
    elsif (params[:selectreport] == "All offered courses")
      @students_report_grid =  initialize_grid(SemesterCourse,:include =>[:course,:semester], :name => 'reportAllOfferedCourses',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllOfferedCourses')
      export_grid_if_requested('reportAllOfferedCourses' => 'reportAllOfferedCourses') do
        render(:partial => 'graduate_students/reports/reportAllOfferedCourses.html',
               :locals => {:students_report_grid=>@students_report_grid},
               :layout => false)
      end
    elsif (params[:selectreport] == "All PhD students' details")
      @students_report_grid =  initialize_grid(Milestone.joins(:student).where("students.degreelevel= 'PhD'"),:include =>[:student=>[:user=>[:user_publications]]], :name => 'reportAllPhdStudents',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllPhdStudents')
      export_grid_if_requested('reportAllPhdStudents' => 'reportAllPhdStudents') do
        render(:partial => 'graduate_students/reports/reportAllPhdStudents.html',
               :locals => {:students_report_grid=>@students_report_grid},
               :layout => false)
      end
    elsif (params[:selectreport] == "All students' publications")
      @students_report_grid = initialize_grid(UserPublication.joins([:user=>[:student]]).where("users.id = students.user_id"),:include=>[:user=>[:student]], :name => 'reportAllStudentsPublications',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsPublications')
      export_grid_if_requested('reportAllStudentsPublications' => 'reportAllStudentsPublications') do
        render(:partial => 'graduate_students/reports/reportAllStudentsPublications.html',
               :locals => {:students_report_grid=>@students_report_grid},
               :layout => false)
      end
    end

  end

  def create
    @student = Student.find_last_by_rollno(params[:rollno])
    if params[:selectreport] == "All students' details"
      @students_report_grid = initialize_grid(Student,:include => [:user,:degree_status_type], :name => 'reportAllStudents',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudents')
      render(:partial => 'graduate_students/reports/reportAllStudents',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All students' detailed information")
      @students_report_grid = initialize_grid(Student,:include => [:user,:probation_status_type], :name => 'reportStudentsDetail',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportStudentsDetail')
      render(:partial => 'graduate_students/reports/reportStudentsDetail',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "Student's enrolled semesters")
      if (!@student.blank?)
        @students_report_grid = initialize_grid(StudentSemester.where(:student_id=>@student.id),:include =>[:semester,:student=>[:user]], :name => 'reportStudentEnrolledSemester',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'reportStudentEnrolledSemester')
      end
      render(:partial => 'graduate_students/reports/reportStudentEnrolledSemester',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "Student's enrolled courses")
      if (!@student.blank?)
        @students_report_grid =  initialize_grid(StudentCourse.where(:student_id=>@student.id),:include =>[:course_status,:grade_type,:course,:semester,:student=>[:user]], :name => 'reportStudentEnrolledCourses',:per_page => 40, :enable_export_to_csv => true, :csv_file_name => 'reportStudentEnrolledCourses')
      end
      render(:partial => 'graduate_students/reports/reportStudentEnrolledCourses',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All students' enrolled semesters")
      @students_report_grid = initialize_grid(StudentSemester,:include =>[:semester,:student=>[:user]], :name => 'reportAllStudentsEnrolledSemesters',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsEnrolledSemesters')
      render(:partial => 'graduate_students/reports/reportAllStudentsEnrolledSemesters',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All students' enrolled courses")
      @students_report_grid =  initialize_grid(StudentCourse,:include =>[:course_status,:grade_type,:course,:semester,:student=>[:user]], :name => 'reportAllStudentsEnrolledCourses',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsEnrolledCourses')
      render(:partial => 'graduate_students/reports/reportAllStudentsEnrolledCourses',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All offered courses")
      @students_report_grid =  initialize_grid(SemesterCourse,:include =>[:course,:semester], :name => 'reportAllOfferedCourses',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllOfferedCourses')
      render(:partial => 'graduate_students/reports/reportAllOfferedCourses.html',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All PhD students' details")
      @students_report_grid =  initialize_grid(Milestone.joins(:student).where("students.degreelevel= 'PhD'"),:include =>[:student=>[:user=>[:user_publications]]], :name => 'reportAllPhdStudents',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllPhdStudents')
      render(:partial => 'graduate_students/reports/reportAllPhdStudents.html',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    elsif (params[:selectreport] == "All students' publications")
      @students_report_grid = initialize_grid(UserPublication.joins([:user=>[:student]]).where("users.id = students.user_id"),:include=>[:user=>[:student]], :name => 'reportAllStudentsPublications',:per_page => 40,
        :enable_export_to_csv => true, :csv_file_name => 'reportAllStudentsPublications')
      render(:partial => 'graduate_students/reports/reportAllStudentsPublications.html',
             :locals => {:students_report_grid=>@students_report_grid},
             :layout => false)
    end
  end
end
