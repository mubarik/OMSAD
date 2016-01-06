class GraduateStudents::StudentCoursesController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @studentcourses = StudentCourse.new
    @studentcourses.course_assets.build
    #@semestersoffered = StudentCourse.get_semesters(params[:id])
    @offeredcourses = []
    render :action => "new", :layout => false
    @viewing = params[:viewing]
  end

  def populate_courses
    @semestercourses = StudentCourse.get_courses(params[:id],params[:seid])
    offeredcourses = {}
    @semestercourses.each {|semcourse| offeredcourses[semcourse.course.id]= semcourse.course.coursename}
    respond_to do |format|
      format.json { render :json => offeredcourses }
    end
  end

  def create
    
#    @studenttakencourses = StudentCourse.select(:course_id).where(:student_id=>@studentid,:semester_id=>@semesterid)
#    @student_courses = Array.new
#    @student_courses.push(0)
#    @studenttakencourses.each do|course|
#     @student_courses.push(course.course_id)
#    end
#    @offeredcourses = SemesterCourse.find(:all, :conditions => ["course_id NOT IN (?)", @student_courses])
    @studentcourses = StudentCourse.new(params[:student_course])
    @studentid = @studentcourses.student_id
    @semesterid = @studentcourses.semester_id
    if @studentcourses.save
      @studentsemesters = StudentSemester.new(:semester_id=>@semesterid,:student_id=>@studentid)
      @studentsemesters.save
      flash[:notice] = "Successfully added"
      if params[:mode] == 'mscourses'
        redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
      elsif params[:mode] == 'indstu'
        redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
      else
        redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id, :viewing=>"studentsemester"
      end
    else
      flash[:error] = 'Please enter valid information!'
      flash[:uploaderror] = 'Upload Failed'
      flash[:noticeduplicate] = @studentcourses.errors[:student_id]
       if params[:mode] == 'mscourses'
        redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
      elsif params[:mode] == 'indstu'
        redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
      else
        redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id, :viewing=>"studentsemester"
      end
      #render :action => "new"
    end
  end

  def edit
    @studentcourses = StudentCourse.find(params[:id])
    @studentcourses.course_assets.build
    @studenttakencourses = StudentCourse.select(:course_id).where(:student_id=>@studentcourses.student_id,:semester_id=>@studentcourses.semester_id)
    @student_courses = Array.new
    @student_courses.push(0)
    @studenttakencourses.each do|course|
      if course.course_id != @studentcourses.course_id
        @student_courses.push(course.course_id)
      end
    end
    @offeredcourses = SemesterCourse.find(:all, :conditions => ["semester_id =? AND course_id NOT IN (?)",@studentcourses.semester_id ,@student_courses])
    render :action => "edit", :layout => false
  end

  def update
    flash.clear
    @studentcourses = StudentCourse.find(params[:id])
    @studentid = @studentcourses.student_id
     if @studentcourses.update_attributes(params[:student_course])
        flash[:notice] = "Successfully updated"
        if params[:mode] == 'mscourses'
          redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
          redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id, :viewing=>"studentsemester"
        end
     else
        flash[:error] = 'Please enter valid information!'
        flash[:uploaderror] = 'Upload Failed'
        #flash[:noticeduplicate] = @studentcourse.errors[:student_id]
        #render :action => "edit", :id => @studentcourses.id
        if params[:mode] == 'mscourses'
          redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        elsif params[:mode] == 'indstu'
          redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
        else
          redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id, :viewing=>"studentsemester"
        end
    end
  end

  def destroy
     flash.clear
     @studentcourses = StudentCourse.find(params[:id])
     @studentid = @studentcourses.student_id
     @studentcourses.destroy
     if params[:mode] == 'mscourses'
       redirect_to :controller => :ms_courses, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
     elsif params[:mode] == 'indstu'
       redirect_to :controller => :independent_studies, :action => 'new', :id => @studentid,:viewing=>"studentsemester"
    else
       redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id, :viewing=>"studentsemester"
    end
 end

end
