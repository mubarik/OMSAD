class GraduateStudents::SemesterCoursesController < ApplicationController
  def index
  end


  def new
    flash.clear
    @semestercourse = SemesterCourse.new
    @semesterid = params[:id]
    #@courses = Course.all
    @courses_already_added = SemesterCourse.select(:course_id).where(:semester_id=>@semesterid)
    @courses_array = Array.new
    @courses_array.push(0)
    @courses_already_added.each do|course|
    @courses_array.push(course.course_id)
    end
    @courses = Course.find(:all, :conditions => ["id NOT IN (?)", @courses_array])
    render :action => "new" , :layout => false
  end

  def create
    if !(params[:courseid].nil?)
      params[:courseid].each do |course|
      SemesterCourse.create(:semester_id => params[:id],:course_id => course)#, :faculty_member_id => params[:user][course] ,:prerequisite => 0)
      end
      flash[:notice] = "Successfully added"
    end
    redirect_to :controller=>:semesters , :action => "index"
  end

  def edit
  end

  def update
  end

  def show
    @semester = Semester.find_by_id(params[:id])
    @semester.courses.delete_all()
    redirect_to :controller=>:semesters , :action => "index"
  end

  def destroy
    if params[:mode] == 'all'
      @semester = Semester.find_by_id(params[:id])
      @semester.courses.delete_all()
    elsif params[:mode] == 'single'
      @course = SemesterCourse.find_by_course_id_and_semester_id(params[:id],params[:semid])
      @course.destroy
    end
    redirect_to :controller=>:semesters , :action => "index"
  end

#  def delete_courses
#    flash.clear
#    @courses = Course.all
#    @semesterid = params[:id]
#    @semester = Semester.find(params[:id])
#    if params[:method] == "post"
#      if !(params[:courseid].nil?)
#        @coursesrecord = SemesterCourse.find_all_by_semester_id(params[:id])
#        params[:courseid].each do |course|
#          @coursesrecord.each do |item|
#            if item.course_id == Integer(course)
#              item.destroy
#            end
#          end
#        end
#      end
#      redirect_to :controller => :semesters ,:action => "index"
#    else
#      render :action => "delete_courses" , :layout => false
#    end
#  end
end
