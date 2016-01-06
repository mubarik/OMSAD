class GraduateStudents::StudentSemestersController < ApplicationController
  def index
  end

  def show
  end
  def uploadfile
   file = params[ :upload ][ :uploadfile ]
    @import = Filestudentsemester.importcourse(file)
     if !@import.blank?
      flash[:notice]="CSV Import Successful"
       redirect_to :controller=> "students" ,:action=>'index'
     else
       flash[:error]= "Error while importing File."
       redirect_to :controller=> "students" ,:action=>'csv_import'
     end
  end

  def new
    flash.clear
    @studentsemester = StudentSemester.new
    @studentsemester.assets.build
    @studentid = params[:id]
    @semesters_already_added = StudentSemester.select(:semester_id).where(:student_id=>@studentid)
    @semesters_array = Array.new
    @semesters_array.push(0)
    @semesters_already_added.each do|semester|
      @semesters_array.push(semester.semester_id)
    end
    @semestersoffered = Semester.find(:all, :conditions => ["id NOT IN (?)", @semesters_array])
    render :action => "new", :layout => false
  end

  def create
    flash.clear
    @studentsemester = StudentSemester.new(params[:student_semester])
   
     if @studentsemester.save
        @studentid = @studentsemester.student_id
        @user = (Student.find_by_id(@studentid)).user_id
      # render :js => "window.location.href = '/GraduateStudents/students/#{@user}?viewing=true'"
        #flash[:notice] = "Successfully added"
        if params[:mode] == 'mscourses'
           redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
           redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"studentsemester"
        end
     else
        @studentid = @studentsemester.student_id
        @user = (Student.find_by_id(@studentid)).user_id
#       flash[:error] = 'Please enter valid information!'
#       flash[:noticeduplicate] = @studentsemester.errors[:student_id]
#       flash[:noticegpa] = @studentsemester.errors[:semestergpa]
#       if !@studentsemester.errors[:semestergpa].blank?
#         render( :js => false ,:partial => 'graduate_students/student_semesters/popupErrorMessage',
#         :locals => {:msg=>'Please enter valid information!'},
#         :layout => false)
#       else
          #flash[:noticecontecttype] = "Invalid File Type selected"
          flash[:uploadSmestererror] = 'Upload Failed'
        if params[:mode] == 'mscourses'
          redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
          redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"studentsemester"
        end
     end
       #render :action => "new"
     #  redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"true"
   
  end

  def edit
      @studentsemester = StudentSemester.find(params[:id])
      @studentsemester.assets.build
      #@student = Student.find(@studentsemester.student_id)
      @semesters_already_added = StudentSemester.select(:semester_id).where(:student_id=>@studentsemester.student_id)
      @semesters_array = Array.new
      @semesters_array.push(0)
      @semesters_already_added.each do|semester|
        if semester.semester_id != @studentsemester.semester_id
          @semesters_array.push(semester.semester_id)
        end
      end
      @semestersoffered = Semester.find(:all, :conditions => ["id NOT IN (?)", @semesters_array])
      render :action => "edit", :layout => false
  end

  def update
    @studentsemester = StudentSemester.find(params[:id])
    @studentid = @studentsemester.student_id
    @user = (Student.find_by_id(@studentid)).user_id
      if @studentsemester.update_attributes(params[:student_semester])
        if params[:mode] == 'mscourses'
          redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
          redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"studentsemester"
        end
     # render :js => "window.location = '/GraduateStudents/students/#{@user}?viewing=true'"
      else
#         if !@studentsemester.errors.blank?
#         render( :js => false ,:partial => 'graduate_students/student_semesters/popupErrorMessage',
#         :locals => {:msg=>'Please enter valid information!'},
#         :layout => false)
#       else
#          flash[:noticecontecttype] = "Invalid File Type selected"
        flash[:uploadSmestererror] = 'Upload Failed'
        if params[:mode] == 'mscourses'
          redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
          redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"studentsemester"
        end
      end
      #end
    #redirect_to :controller=>"students" ,:action => "show",:id=>@user,:viewing=>"true"
  end

  def destroy
    flash.clear
    @studentsemester = StudentSemester.find(params[:id])
    @studentid = @studentsemester.student_id
    #@studentsemester.destroy
    @thesis_exists = MsCourse.find(:all,:conditions=>["student_semester1_id = (?) OR student_semester2_id = (?) AND student_id = (?)", params[:id],params[:id],@studentid])
    @independent_studies_exists = IndependentStudy.select(:id).where(:student_semester_id=>params[:id], :student_id=>@studentid)
    if @thesis_exists.blank? and @independent_studies_exists.blank?
      @studentsemester.destroy
    end
    @coursesrecord = StudentCourse.select(:id).where(:semester_id=>@studentsemester.semester_id,:student_id=>@studentsemester.student_id)
    @coursesrecord.each do |course|
        course.destroy
    end
    if params[:mode] == 'mscourses'
      redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
    elsif params[:mode] == 'indstu'
       redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
    else
      redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id,:viewing=>"studentsemester"
    end
  end
end
