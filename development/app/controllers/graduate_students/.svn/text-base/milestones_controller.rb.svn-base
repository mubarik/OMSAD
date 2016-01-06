class GraduateStudents::MilestonesController < ApplicationController

  def index
     @milestones = Milestone.all
  end

  def show

      @student = Student.find(params[:id])
     @milestone = @student.milestone
     if params[:mode] == 'report'
       render :action => 'phdreport'
     else
     render :action => 'show' , :layout => false
     end
  end

    def uploadfile
   file = params[ :upload ][ :uploadfile ]
    @import = Milestone.importphd(file)
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
      render :action=>'cosupervisornew',:layout=>false
    else
      @milestone = Milestone.new
      @student = Student.find_by_id(params[:id])
      @saved = params[:saved]
    end
  end

  def create
    if params[:mode] == 'supervisor'
      @milestone = Milestone.find_by_id(params[:id])
      @student = Student.find_by_id(@milestone.student_id)
      @cosupervisor = Cosupervisor.new(params[:cosupervisor])
      if @cosupervisor.save
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"PhdDetail"
    else
    
    @milestone = Milestone.new(params[:milestone])
    @student = Student.find_by_id(@milestone.student_id)
      if @milestone.save
        flash[:notice] = 'User successfully added.'
        if params[:saved] == "true"
          @savedtonext="true"
          @saved = params[:saved]
          render :action => "new"
        else
           redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"PhdDetail"
        end
       else
         flash[:error] = 'Please enter valid information!'
         render :action => "new"
    end
    
  end
 end
  def edit
    if params[:mode] == 'supervisor'
      @cosupervisor = Cosupervisor.find_by_id(params[:id])
      render :action=>'cosupervisoredit',:layout=>false
    else
      @milestone = Milestone.find_by_id(params[:id])
      @student = Student.find_by_id(@milestone.student_id)
   
    end
  end

  def update
flash.clear
    if params[:mode] == 'supervisor'
      @milestone = Milestone.find_by_id(params[:mscid])
      @student = Student.find_by_id(@milestone.student_id)
      @cosupervisor = Cosupervisor.find_by_id(params[:id])
      if @cosupervisor.update_attributes(params[:cosupervisor])
        flash[:notice] = 'Successfully updated'
      end
      redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"PhdDetail"
    else
      @milestone = Milestone.find_by_id(params[:id])
      @student = Student.find_by_id(@milestone.student_id)
      if @milestone.update_attributes(params[:milestone])
        flash[:notice] = 'Successfully updated'
        #render :action => "edit"
        redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"PhdDetail"
      else
        flash[:error] = 'Please enter valid information!'
        render :action => "edit"
      end
    end

   end

  def destroy
      @milestone = Milestone.find_by_id(params[:mscid])
     @student = Student.find_by_id(@milestone.student_id)
     if params[:mode] == 'supervisor'
        @cosupervisor = Cosupervisor.find_by_id(params[:id])
        @cosupervisor.destroy
     elsif
       @milestone.destroy
     end
     redirect_to :controller=>"students" ,:action => "show",:id=>@student.user_id,:viewing=>"PhdDetail"
  end

end
