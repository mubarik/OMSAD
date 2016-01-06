class GraduateStudents::FinancialAidsController < ApplicationController


  def index
     @financialaids = FinancialAid.all
  end


  def show
     @student = Student.find_by_id(params[:id])
     @financialaids = FinancialAid.find(@student.user_id)
  end


  def new
    flash.clear
    @financialaid = FinancialAid.new
    @financialaid.financial_assets.build
    @studentid = params[:id]
    @semestersoffered = FinancialAid.get_semesters(@studentid)
    render :action => "new", :layout => false
  end


  def create
    flash.clear
    @financialaid = FinancialAid.new(params[:financial_aid])
    if @financialaid.save
      @studentid = @financialaid.student_id
      @user = (Student.find_by_id(@studentid)).user_id
     #render :js => "window.location.href = '/GraduateStudents/students/#{@user}?viewing=financialaid'"
    redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
    else
      @studentid = @financialaid.student_id
#      flash[:error] = 'Please enter valid information!'
#      if !@financialaid.errors[:amount].blank?
#      render(:partial => 'graduate_students/financial_aids/popupErrorMessage',
#             :locals => {:msg=>'Please enter valid information!'},
#            :layout => false)
#      else
       flash[:financialerror] = "Upload Failed"
        redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
      end
  end

  
  def edit
    @financialaid = FinancialAid.find_by_student_semester_id(params[:id])
    @financialaid.financial_assets.build
    @studentid = Student.find(@financialaid.student_id)
    @semestersoffered = FinancialAid.get_semesters_for_edit(@studentid,Integer(params[:id]))
    render :action => "edit", :layout => false
  end


  def update
    @financialaid = FinancialAid.find_by_student_semester_id(params[:id])
    @studentid = @financialaid.student_id
    @user = (Student.find_by_id(@studentid)).user_id
    if @financialaid.update_attributes(params[:financial_aid])
     # render :js => "window.location = '/GraduateStudents/students/#{@user}?viewing=financialaid'"
    redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
    else
#     if !@financialaid.errors[:amount].blank?
#      render(:partial => 'graduate_students/financial_aids/popupErrorMessage',
#             :locals => {:msg=>'Please enter valid information!'},
#            :layout => false)
#      else
      #flash[:noticecontecttype] = "Invalid File Type selected"
        flash[:financialerror] = "Upload Failed"
        redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
      end

#    end
#    redirect_to :controller=>"students" ,:action => "show",:id=>(Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
  end


  def destroy
    flash.clear
    @financialaid = FinancialAid.find_by_student_semester_id(params[:id])
    @studentid = @financialaid.student_id
    @financialaid.destroy
    redirect_to :controller => :students , :action => "show", :id => (Student.find_by_id(@studentid)).user_id,:viewing=>"financialaid"
  end

  
end
