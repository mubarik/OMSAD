class Inventory::TacoursesController < ApplicationController
  def new
      @ta_course = TaCourse.new
      @offeredcourses = []
     render :action=> "new", :layout => false
  end
  def edit
      @ta_course = TaCourse.find_by_id(params[:id])
      @offeredcourses = []
     render :action=> "edit", :layout => false
  end
  def populate_courses
    @semestercourses = TaCourse.get_semester_courses(params[:id],params[:semid])
    offeredcourses = {}
    @semestercourses.each {|semcourse| offeredcourses[semcourse.course.id]= semcourse.course.coursename}
    respond_to do |format|
      format.json { render :json => offeredcourses }
    end
  end
  def create
    @ta_course = TaCourse.new(params[:ta_course])
    if @ta_course.save
      if !(@ta_course.user.t_assistant.blank?)
          redirect_to :controller=>"inventory/tassistants" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      elsif !(@ta_course.user.ustudent.blank?)
        redirect_to :controller=>"inventory/ustudents" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      elsif !(@ta_course.user.student.blank?)
          redirect_to :controller=>"GraduateStudents/students" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      end
    else
      if !(@ta_course.user.t_assistant.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"inventory/tassistants" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      elsif !(@ta_course.user.ustudent.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"inventory/ustudents" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      elsif !(@ta_course.user.student.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"GraduateStudents/students" ,:action=>"show", :id => params[:id],:viewing => "tacourse"
      end
      
    end
  end

  def update
    @ta_course = TaCourse.find_by_id(params[:id])
    if @ta_course.update_attributes(params[:ta_course])
      if !(@ta_course.user.t_assistant.blank?)
          redirect_to :controller=>"inventory/tassistants" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      elsif !(@ta_course.user.ustudent.blank?)
          redirect_to :controller=>"inventory/ustudents" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      elsif !(@ta_course.user.student.blank?)
          redirect_to :controller=>"GraduateStudents/students" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      end
    else
      if !(@ta_course.user.t_assistant.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"inventory/tassistants" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      elsif !(@ta_course.user.ustudent.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"inventory/ustudents" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      elsif !(@ta_course.user.student.blank?)
          flash[:uploadFail]="Upload Failed"
          redirect_to :controller=>"GraduateStudents/students" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
      end
    end

  end
  def destroy
    @ta_course = TaCourse.find_by_id(params[:id])
#    ta_id = @ta_course.t_assistant_id
#    user_id = TAssistant.find_by_id(ta_id).user_id
    @ta_course.destroy

    if !(@ta_course.user.t_assistant.blank?)
        redirect_to :controller=>"inventory/tassistants" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
    elsif !(@ta_course.user.ustudent.blank?)
        redirect_to :controller=>"inventory/ustudents" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
    elsif !(@ta_course.user.student.blank?)
        redirect_to :controller=>"GraduateStudents/students" ,:action=>"show", :id => @ta_course.user_id,:viewing => "tacourse"
    end
  end
end
