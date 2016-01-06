class GraduateStudents::StudentsController < ApplicationController
  require 'index_wrapper'
  add_breadcrumb 'Students', 'students'
  add_breadcrumb 'Add Student', '', :only => [:new, :create]
  add_breadcrumb 'Edit Student', '', :only => [:edit, :update]
  require "csv"

  def index
    flash.clear
    #add_breadcrumb "Enrolled Students", ''
    @students = Student.all_wrappers
   #@students = Student.paginate :per_page =>2, :page=>params[:page], :conditions=>['degreelevel like ?',"%MS%"]
    #@page = params[:page]
    #@students = Student.paginate :per_page =>5, :page=>params[:page]
  end

  def show
    
    if params[:id] == 'students'
      redirect_to :action=>'index'
    else
      @student = Student.find_by_user_id(params[:id])
      add_breadcrumb @student.user.name, ''
      @viewing = params[:viewing]
    end
  end
  
  def new
    flash.clear
    @user = User.new
    @student = @user.build_student
    @user.user_user_types.build
    @user.user_user_types[0].user_type_id = 2
    #@student.build_FinancialAid
    #@student.build_milestone
  end

  def create
    flash.clear
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User successfully added.'
      #redirect_to :controller=> 'ms_courses', :action=> 'new', :id => @user.student.id
      #redirect_to :controller=> 'independent_studies', :action=> 'new', :id => @user.student.id
      @saved = true
      render :action => "new"
     else
       flash[:error] = 'Please enter valid information!'
       render :action => "new"
     end
  end
  
  def edit
    flash.clear
    @user = User.find_by_id(params[:id])
  end

  def update
    flash.clear
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Successfully updated'
      render :action => "edit"
    else
      flash[:error] = 'Please enter valid information!'
      render :action => "edit"
    end
  end
  
  def destroy
    #student = Student.find_by_id(params[:id])
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to :action => "index"
  end

  def routing
    redirect_to :action=>'index'
  end

  def csv_import

    @uploadcheck = UploadCheck.new
   
  end


  def uploadfile

    @uploadcheck = UploadCheck.new(params[:upload_check])
    if @uploadcheck.save
     bib = CSV.open File.path(@uploadcheck.uploadfile.path )
     @delete = @uploadcheck.destroy
     @deleteallprevious = Filestudent.destroy_all()
       n = 0
       bib.each  do |row|
         if row.count == 16
           if (Student.find_by_rollno(row[8])).nil?
            c=Filestudent.new
            c.name=row[0]
            c.dob=row[1]
            c.gender=row[2]
            c.department=row[3]
            c.address=row[4]
            c.contactno=row[5]
            c.email=row[6]
            c.usertype=row[7]
            c.rollno=row[8]
            c.credithrs=row[9]
            c.financialaid=row[10]
            c.cgpa=row[11]
            c.degreelevel=row[12]
            c.probation=row[13]
            c.currentstatus=row[14]
            c.admission=row[15]

              if c.save
              n=n+1
              GC.start if n%50==0
              end
           end
         else
           flash[:msgRed] = "Invalid File"
           redirect_to :controller=> :students, :action=>'csv_import'
           return
         end
      end
      @savestudent = Filestudent.studentsave
      if !(n == 0)
        flash[:notice]= n.to_s << " Students(s) successfully added"
      else
        flash[:msgRed]= "No new student added"
      end
    else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :students, :action=>'csv_import'
  end

   def uploadstudentsemester

     @uploadcheck = UploadCheck.new(params[:upload_check])
     if @uploadcheck.save
       bib = CSV.open File.path(@uploadcheck.uploadfile.path )
       @delete = @uploadcheck.destroy
       @deleteallprevious = Filestudentsemester.destroy_all()
       n = 0
       bib.each  do |row|
        if row.count == 8
          if !(Student.find_by_rollno(row[0])).nil?
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
              n=n+1
              GC.start if n%50==0
              end
          end
         else
             flash[:msgRed] = "Invalid File"
             redirect_to :controller=> :students, :action=>'csv_import'
             return
         end
      end
      Filestudentsemester.studentsave
      if !(n == 0)
        flash[:notice]= "Student semesters and courses successfully added"
      else
        flash[:msgRed]= "No student semester/courses added"
      end
   else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :students, :action=>'csv_import'
  end
  
   def uploadphd

     @uploadcheck = UploadCheck.new(params[:upload_check])
     if @uploadcheck.save
     bib = CSV.open File.path(@uploadcheck.uploadfile.path )
     @delete = @uploadcheck.destroy
     n = 0
     bib.each  do |row|
       if row.count == 11
         @student = Student.find_by_rollno(row[0])
         if !@student.blank?
         @milestone = Milestone.find_by_student_id(@student)
          if @milestone.blank?
           c= Milestone.new
           c.student_id = @student.id
           c.title=row[1]
           c.supervisorcomments = row[2]
           @user = User.find_by_name(row[3]) rescue 'none'
           if !@user.blank?
           @faculty = FacultyMember.find_by_user_id(@user.id)
           c.faculty_member_id =  @faculty.id
           else
               flash[:msgRed]= "Supervisor not available"
               redirect_to :controller=> :students, :action=>'csv_import'
               return
           end
           c.qualifierstatus = row[4]
           c.proposalsubmission = row[5]
           c.thesisdefence = row[6]
           c.granttype = row[7]
           c.grantname = row[8]
           @research = ResearchGrant.find_by_title(row[9])
           if !@research.blank?
           c.research_grant_id = @research.id
           end
           
           c.grantstatus = row[10]

              if c.save
              n=n+1
              GC.start if n%50==0
              end
          end
         end
      else
           flash[:msgRed] = "Invalid File"
           redirect_to :controller=> :students, :action=>'csv_import'
           return
      
      end
    end
     if !(n == 0)
      flash[:notice]= n.to_s << " PHD student(s) details successfully added"
     else
      flash[:msgRed]= "No PHD student details added"
     end
   else
      flash[:msgRed]= "Invalid file extention"
   end
   redirect_to :controller=> :students, :action=>'csv_import'
  end


    def uploadthesis
     
      @uploadcheck = UploadCheck.new(params[:upload_check])
      if @uploadcheck.save
      bib = CSV.open File.path(@uploadcheck.uploadfile.path )
      @delete = @uploadcheck.destroy
      n = 0
      bib.each  do |row|
        if row.count == 10
         @student = Student.find_by_rollno(row[0])
         if !@student.blank?
          @mscourse = MsCourse.find_by_student_id(@student)
           if @mscourse.blank?
             c=MsCourse.new
             @students = Student.find_by_rollno(row[0])
             c.student_id = @students.id
             c.title=row[1]
             @user = User.find_by_name(row[2]) rescue 'none'
             if !@user.blank?
               @faculty = FacultyMember.find_by_user_id(@user.id)
               c.faculty_member_id =  @faculty.id
               else
               flash[:msgRed]= "Supervisor not available"
               redirect_to :controller=> :students, :action=>'csv_import'
               return
             end
             c.coursetype = row[3]
             @semester1 = Semester.find_by_offering_and_year(row[4], row[5])
             if @semester1.blank?
              @semester1 = Semester.create(:offering => row[4], :year => row[5])
             end
             @studentsemester1 = StudentSemester.find_by_semester_id_and_student_id(@semester1.id, @student.id)
             if @studentsemester1.blank?
              @studentsemester1 = StudentSemester.create(:student_id => @student.id, :semester_id => @semester1.id)

             end
             c.student_semester1_id = @studentsemester1.id
             c.proposaldefencedate = row[6]
               if row[3] == 'Thesis'
                 @semester2 = Semester.find_by_offering_and_year(row[7], row[8])
                 if @semester2.blank?
                  @semester2 = Semester.create(:offering => row[7], :year => row[8])
                 end
                 @studentsemester1 = StudentSemester.find_by_semester_id_and_student_id(@semester2.id, @student.id)
                   if @studentsemester1.blank?
                  @studentsemester2 =   StudentSemester.create(:student_id => @student.id, :semester_id => @semester2.id)
                   end
                 c.student_semester2_id = @studentsemester2.id
                 c.thesisdefencedate = row[9]
               end
           
                if c.save
                n=n+1
                GC.start if n%50==0
                end
            end
         end
          else
               flash[:msgRed] = "Invalid File"
               redirect_to :controller=> :students, :action=>'csv_import'
               return
          end
        end
      if !(n == 0)
        flash[:notice]= n.to_s << " MS Thesis/Project details successfully added"
      else
        flash[:msgRed]= "No Thesis/Project details added"
        
      end
   else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :students, :action=>'csv_import'
  end

  def uploadstudy
        
      @uploadcheck = UploadCheck.new(params[:upload_check])
      if @uploadcheck.save
      bib = CSV.open File.path(@uploadcheck.uploadfile.path )
      @delete = @uploadcheck.destroy
      n = 0
      bib.each  do |row|
        if row.count == 8
        
          @student = Student.find_by_rollno(row[0])
          if !@student.blank?
            c=IndependentStudy.new
            c.student_id = @student.id
            c.studytitle = row[1]
            c.studycode = row[2]
            c.studycredithrs = row[3]
            @semester1 = Semester.find_by_offering_and_year(row[4], row[5])
                if @semester1.blank?
                  @semester1 = Semester.create(:offering => row[4], :year => row[5])
                end
            @studentsemester = StudentSemester.find_by_semester_id_and_student_id(@semester1.id, @student.id)
                 if @studentsemester.blank?
                   StudentSemester.create(:student_id => @student.id, :semester_id => @semester1.id)
                 end
            @grade = GradeType.find_by_name(row[6])
                 if @grade.blank?
                    @grade = GradeType.create(:name => row[6], :project_conf_id => 1 )
                 end
            c.grade_type_id = @grade.id
            @user = User.find_by_name(row[2]) rescue 'none'
             if !@user.blank?
               @faculty = FacultyMember.find_by_user_id(@user.id)
               c.faculty_member_id =  @faculty.id
             else
               flash[:msgRed]= "Supervisor not available"
               redirect_to :controller=> :students, :action=>'csv_import'
               return
             end

              if c.save
              n=n+1
              GC.start if n%50==0
              end
           end
          else
           flash[:msgRed] = "Invalid File"
           redirect_to :controller=> :students, :action=>'csv_import'
           return
          end
        end
      if !(n == 0)
        flash[:notice]= n.to_s << "Independent study details successfully added"        
      else
        flash[:msgRed]= "No independent study details added"       
      end
   else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :students, :action=>'csv_import'
  end
end
