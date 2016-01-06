class GraduateStudents::CoursesController < ApplicationController
  require 'index_wrapper'
  add_breadcrumb 'Courses', 'courses'
  add_breadcrumb 'Add Course', '', :only => [:new, :create]
  add_breadcrumb 'Edit Course', '', :only => [:edit, :update]

  def index
    flash.clear
    #add_breadcrumb "Offered Courses", ''
    @courses = Course.all_wrappers
  end

  def uploadfile
    @uploadcheck = UploadCheck.new(params[:upload_check])
    if @uploadcheck.save
     bib = CSV.open File.path(@uploadcheck.uploadfile.path )
     @delete = @uploadcheck.destroy
    n = 0
     bib.each  do |row|
        if row.count == 4
          @course = Course.find_by_coursecode(row[0])
          if @course.blank?
           c=Course.new
           c.coursecode   =row[0]
           c.coursename   =row[1]
           c.coursetype   =row[2]
           c.credithrs    =row[3]
            if c.save
            n=n+1
            GC.start if n%50==0
            end
          end
        else
         flash[:msgRed] = "Invalid File"
         redirect_to :controller=> :courses, :action=>'csv_import'
         return
        end
      end
       if !(n == 0)
        flash[:notice]= n.to_s << " Courses successfully added"       
      else
        flash[:msgRed]= "No course added"
     end
   else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :courses, :action=>'csv_import'
  end

  def csv_import
     @uploadcheck = UploadCheck.new
  end
  
  def show
    flash.clear
    @course = Course.find_by_id(params[:id])
    redirect_to :action=>'index'
  end

  def new
    flash.clear
    @courses = Course.new
  end

  def create
    flash.clear
    @courses = Course.new(params[:course] )
    if @courses.save
      flash[:notice] = 'Successfully added.'
      redirect_to :action => "index"
    else
      flash[:error] = 'Please enter valid information!'
      flash[:noticename] = @courses.errors[:coursename]
      flash[:noticecode] = @courses.errors[:coursecode]
      flash[:noticecredit] = @courses.errors[:credithrs]
      render :action => "new"
    end
  end

  def edit
    @courses = Course.find(params[:id])
  end

  def update
    @courses = Course.find(params[:id])
   if @courses.update_attributes(params[:course])
       flash[:notice] = 'Successfully updated.'
       redirect_to :action => "index"
     else
        flash[:error] = 'Please enter valid information!'
        flash[:noticename] = @course.errors[:coursename]
        flash[:noticecode] = @course.errors[:coursecode]
        flash[:noticecredit] = @course.errors[:credithrs]
       render :action => "edit", :id => params[:id]
     end
  end
  
  def destroy
    @course = Course.find_by_id(params[:id])
    @course.destroy
    redirect_to :action => "index"
  end

  def routing
    redirect_to :action=>'index'
  end

end
