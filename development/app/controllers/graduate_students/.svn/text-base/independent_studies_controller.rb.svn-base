class GraduateStudents::IndependentStudiesController < ApplicationController
  helper :all
  def index
  end

  def new
    flash.clear
    if params[:mode] == 'supervisor'
      @cosupervisor = Cosupervisor.new
      @mode = params[:mode]
      render :action=>'cosupervisornew',:layout=>false
    else
      @student = Student.find_by_id(params[:id])
      @independentstudy = @student.independent_studies.build
      #@independentstudy.cosupervisors.build
      @saved = params[:saved]
      if @saved
        @semesters = Semester.all
      else
        @semesters = StudentSemester.find_all_by_student_id(@student.id)
      end
    end
    @viewing = params[:viewing]
  end

  def uploadfile
   file = params[ :upload ][ :uploadfile ]
    @import = IndependentStudy.importstudy(file)
     if !@import.blank?
      flash[:notice]="CSV Import Successful"
       redirect_to :controller=> "students" ,:action=>'index'
     else
       flash[:error]= "Error while importing File."
       redirect_to :controller=> "students" ,:action=>'index'
     end
  end

  def create
    flash.clear
    if params[:mode] == 'supervisor'
      @independentstudy = IndependentStudy.find_by_id(params[:id])
      @student = Student.find_by_id(@independentstudy.student_id)
      @cosupervisor = Cosupervisor.new(params[:cosupervisor])
      if @cosupervisor.save
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"indstu"
    else
      @student = Student.find_by_id(params[:id])
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Successfully updated'
        if params[:saved] == "true"
          if !@student.independent_studies.blank?
            @student.independent_studies.each do |ind_stu|
              @studentsemesters = StudentSemester.new(:semester_id=>ind_stu.student_semester_id,:student_id=>params[:id])
              @studentsemesters.save
              ind_stu.update_attributes(:student_semester_id=>@studentsemesters.id)
            end
          end
          @semesters = Semester.all
          @savedtonext="true"
          @saved = params[:saved]
          @student = Student.find_by_id(params[:id])
          @independentstudy = @student.independent_studies.build
          #@independentstudy.cosupervisors.build
          render :action => "new"
        else
          redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"indstu"
        end
      else
         flash[:error] = 'Please enter valid information!'
         if params[:saved] == "true"
           @semesters = Semester.all
           @saved = params[:saved]
         else
           @semesters = StudentSemester.find_all_by_student_id(@student.id)
         end
         render :action => "new"
      end
    end

  end


  def edit
    if params[:mode] == 'supervisor'
      @cosupervisor = Cosupervisor.find_by_id(params[:id])
      @mode = params[:mode]
      render :action=>'cosupervisoredit',:layout=>false
    else
      @student = Student.find_by_id(params[:id])
      @semesters = StudentSemester.find_all_by_student_id(@student.id)
    end
  end

  def update
    flash.clear
    if params[:mode] == 'supervisor'
      @independentstudy = IndependentStudy.find_by_id(params[:indstuid])
      @student = Student.find_by_id(@independentstudy.student_id)
      @cosupervisor = Cosupervisor.find_by_id(params[:id])
      if @cosupervisor.update_attributes(params[:cosupervisor])
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"indstu"
    else
      @student = Student.find_by_id(params[:id])
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Successfully updated'
        @semesters = StudentSemester.find_all_by_student_id(@student.id)
        if params[:saved] == "true"
          @savedtonext="true"
          @saved = params[:saved]
          @student = Student.find_by_id(params[:id])
          render :action => "edit"
        else
          redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"indstu"
        end
      else
          flash[:error] = 'Please enter valid information!'
          @semesters = StudentSemester.all
          render :action => "edit"
      end
    end
  end

  def show
  end

  def destroy
    @independentstudy = IndependentStudy.find_by_id(params[:indstuid])
    @student = Student.find_by_id(@independentstudy.student_id)
    if params[:mode] == 'supervisor'
       @cosupervisor = Cosupervisor.find_by_id(params[:id])
       @cosupervisor.destroy
    else
      @thesis_exists = MsCourse.find(:all,:conditions=>["student_semester1_id = (?) OR student_semester2_id = (?) AND student_id = (?)", @independentstudy.student_semester_id,@independentstudy.student_semester_id,@independentstudy.student_id])
      @courses = StudentCourse.select(:id).where(:semester_id=>@independentstudy.student_semester.semester_id,:student_id=>@independentstudy.student_id)
      if @courses.blank? and @thesis_exists.blank?
        @studentsemester = StudentSemester.find(@independentstudy.student_semester_id)
        @studentsemester.destroy
      end
      @independentstudy.destroy
    end
    if params[:path] == 'self'
      redirect_to :action => "new",:id=>@student.user_id
    else
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"indstu"
    end
    
  end
end
