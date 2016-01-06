class GraduateStudents::MsCoursesController < ApplicationController
  def index
    flash.clear
  end

  def show

  end

   def uploadfile
   file = params[ :upload ][ :uploadfile ]
    @import = MsCourse.importthesis(file)
     if !@import.blank?
      flash[:notice]="CSV Import Successful"
       redirect_to :controller=> "students" ,:action=>'index'
     else
       flash[:error]= "Error while importing File."
       redirect_to :controller=> "students" ,:action=>'index'
     end
    end

  def new
    flash.clear
    if params[:mode] == 'supervisor'
      @cosupervisor = Cosupervisor.new
      @mode = params[:mode]
      render :action=>'cosupervisornew',:layout=>false
    else
      @mscourse = MsCourse.new
      #@mscourse.cosupervisors.build
      @student = Student.find_by_id(params[:id])
      @saved = params[:saved]
      if @saved
        @semesters = Semester.all
      else
        @semesters = StudentSemester.find_all_by_student_id(@student.id)
      end
    end
    @viewing = params[:viewing]
  end

  def create
    flash.clear
    if params[:mode] == 'supervisor'
      @mscourse = MsCourse.find_by_id(params[:id])
      @student = Student.find_by_id(@mscourse.student_id)
      @cosupervisor = Cosupervisor.new(params[:cosupervisor])
      if @cosupervisor.save
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"msthesis"
    else
      @mscourse = MsCourse.new(params[:ms_course])
      @student = Student.find_by_id(@mscourse.student_id)
      if @mscourse.save
        flash[:notice] = 'User successfully added.'
        #redirect_to :controller=> 'ms_courses', :action=> 'new', :id => @user.student.id
        #render :action => "new"
        if params[:saved] == "true"
          if !@mscourse.student_semester1_id.blank?
            @studentsemesters = StudentSemester.new(:semester_id=>@mscourse.student_semester1_id,:student_id=>@mscourse.student_id)
            @studentsemesters.save
            @mscourse.update_attributes(:student_semester1_id=>@studentsemesters.id)
          end
          if !@mscourse.student_semester2_id.blank?
            @studentsemesters = StudentSemester.new(:semester_id=>@mscourse.student_semester2_id,:student_id=>@mscourse.student_id)
            @studentsemesters.save
            @mscourse.update_attributes(:student_semester2_id=>@studentsemesters.id)
          end
          @semesters = Semester.all
          @savedtonext="true"
          @saved = params[:saved]
          render :action => "new"
        else
           redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"msthesis"
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
      @mscourse = MsCourse.find_by_id(params[:id])
      @student = Student.find_by_id(@mscourse.student_id)
      @semesters = StudentSemester.find_all_by_student_id(@student.id)
    end
  end

  def update
    flash.clear
    if params[:mode] == 'supervisor'
      @mscourse = MsCourse.find_by_id(params[:mscid])
      @student = Student.find_by_id(@mscourse.student_id)
      @cosupervisor = Cosupervisor.find_by_id(params[:id])
      if @cosupervisor.update_attributes(params[:cosupervisor])
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"msthesis"
    else
      @mscourse = MsCourse.find_by_id(params[:id])
      @student = Student.find_by_id(@mscourse.student_id)
      if @mscourse.update_attributes(params[:ms_course])
        flash[:notice] = 'Successfully updated'
        #render :action => "edit"
        @semesters = StudentSemester.find_all_by_student_id(@student.id)
        redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"msthesis"
      else
        flash[:error] = 'Please enter valid information!'
        @semesters = StudentSemester.find_all_by_student_id(@student.id)
        render :action => "edit"
      end
    end
  end

  def destroy
     @mscourse = MsCourse.find_by_id(params[:mscid])
     @student = Student.find_by_id(@mscourse.student_id)
     if params[:mode] == 'supervisor'
        @cosupervisor = Cosupervisor.find_by_id(params[:id])
        @cosupervisor.destroy
     else
        if !@mscourse.student_semester1_id.blank?
          @studentsemester = StudentSemester.find(@mscourse.student_semester1_id)
          @courses = StudentCourse.select(:id).where(:semester_id=>@studentsemester.semester_id,:student_id=>@mscourse.student_id)
          @independent_studies_exists = IndependentStudy.select(:id).where(:student_semester_id=>@mscourse.student_semester1_id, :student_id=>@mscourse.student_id)
          if @courses.blank? and @independent_studies_exists.blank?
            @studentsemester.destroy
          end
        end
        if !@mscourse.student_semester2_id.blank?
          @studentsemester = StudentSemester.find(@mscourse.student_semester2_id)
          @courses = StudentCourse.select(:id).where(:semester_id=>@studentsemester.semester_id,:student_id=>@mscourse.student_id)
          @independent_studies_exists = IndependentStudy.select(:id).where(:student_semester_id=>@mscourse.student_semester2_id, :student_id=>@mscourse.student_id)
          if @courses.blank? and @independent_studies_exists.blank?
            @studentsemester.destroy
          end
        end
       @mscourse.destroy
     end
     redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"msthesis"
  end
end
