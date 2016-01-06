class GraduateStudents::SemestersController < ApplicationController


  add_breadcrumb 'Semesters', 'semesters'
  add_breadcrumb 'Add Semester', '', :only => [:new, :create]
  add_breadcrumb 'Edit Semester', '', :only => [:edit, :update]
require "csv"


  def index
    flash.clear
    #add_breadcrumb "Offered Semesters", ''
    @semesters = Semester.all
    

  end

  def uploadfile
   @uploadcheck = UploadCheck.new(params[:upload_check])
   if @uploadcheck.save
     bib = CSV.open File.path(@uploadcheck.uploadfile.path )
     @delete = @uploadcheck.destroy
     n = 0
     bib.each  do |row|
       if row.count == 2
         @semester = Semester.find_by_offering_and_year(row[0],row[1])
         if @semester.blank?
           c=Semester.new
           c.offering =row[0]
           c.year     =row[1]

            if c.save
            n=n+1
            GC.start if n%50==0
            end
         end
       else
         flash[:msgRed] = "Invalid File"
         redirect_to :controller=> :semesters, :action=>'csv_import'
         return
        end
    end
      if !(n == 0)
        flash[:notice]= n.to_s << " Semesters successfully added"
      else
        flash[:msgRed]= "No new semester added"
     
      end
  else
      flash[:msgRed]= "Invalid file extention"
    end
    redirect_to :controller=> :semesters, :action=>'csv_import'
  end

  def csv_import
   @uploadcheck = UploadCheck.new
  end


  def show
     @semester = Semester.find_by_id(params[:id])
     redirect_to :action=>'index'
  end

  def new
    @semester = Semester.new
    flash.clear
  end

  def create
    flash.clear
    @semester = Semester.new(params[:semester])
    if @semester.save
     flash[:notice] = 'Semester successfully added.'
     redirect_to :action=>'index'
    else
      flash[:noticeoffering] = @semester.errors[:offering]
      flash[:error] = 'Please enter valid information!'
      render :action => "new"
    end
  end

 def edit
  flash.clear
  @semester = Semester.find(params[:id])
 end

 def update
  @semester = Semester.find(params[:id])
  if @semester.update_attributes(params[:semester])
     flash[:notice] = 'Successfully updated.'
     redirect_to :action => "index"
  else
     flash[:error] = 'Please enter valid information!'
     flash[:noticeoffering] = @semester.errors[:offering]
     render :action => "edit", :id => params[:id]
  end
 end

 def destroy
  @semesters = Semester.all
  if params[:what] == "semester"
    @semester = Semester.find_by_id(params[:id])
    @semester.destroy
    redirect_to :action => "index"
  end
 end

 def routing
    redirect_to :action=>'index'
 end

end




