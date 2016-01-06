class Faculty::FacultycoursesController < ApplicationController

  def new
    @faculty_course = FacultyCourse.new
    @offeredcourses = []
    render :action=> "new", :layout => false
  end

  def populate_courses
    @semestercourses = FacultyCourse.get_semester_courses(params[:id],params[:semid])
    offeredcourses = {}
    @semestercourses.each {|semcourse| offeredcourses[semcourse.course.id]= semcourse.course.coursename}
    respond_to do |format|
      format.json { render :json => offeredcourses }
    end
  end

  def create
    user_id = FacultyMember.find_by_id(params[:faculty_course][:faculty_member_id]).user_id
   
    @faculty_course = FacultyCourse.new(params[:faculty_course])
    if(@faculty_course.save)
     redirect_to :controller=>"faculty/facultymembers" ,:action=>"show", :id =>user_id,:viewing=>"facultyCourses"
    end
  end

  def edit
     @faculty_course = FacultyCourse.find_by_id(params[:id])   
     render :action => "edit", :layout => false
  end

  def update
    @faculty_course = FacultyCourse.find_by_id(params[:id])
    @faculty_course.update_attributes(params[:faculty_course])

    user_id = FacultyMember.find_by_id(params[:faculty_course][:faculty_member_id]).user_id
    redirect_to :controller=>"faculty/facultymembers" ,:action=>"show", :id =>user_id,:viewing=>"facultyCourses"
  end
  
  def destroy
    @faculty_course = FacultyCourse.find_by_id(params[:id])
    faculty_id = @faculty_course.faculty_member_id
    user_id = FacultyMember.find_by_id(faculty_id).user_id
    @faculty_course.destroy

    redirect_to :controller=>"faculty/facultymembers" ,:action=>"show", :id =>user_id,:viewing=>"facultyCourses"
  end

end
