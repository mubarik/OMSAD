class Faculty::FacultymembersController < ApplicationController
  require 'index_wrapper'
  require 'globalconstants'
  require "prawn"
  add_breadcrumb 'Faculty','facultymembers',:only => [:new, :edit, :create,:show]
  add_breadcrumb 'Add Faculty', '', :only => [:new, :create]


  def index

    add_breadcrumb 'Faculty',''
    @faculty_member_wrappers = FacultyMember.all_wrappers
  end

  def new

    @faculty_member = FacultyMember.new
    @faculty_member.services.build
    @user = @faculty_member.build_user
    @user.user_user_types.build
    @user.user_user_types[0].user_type_id = 1

    FacultyMemberStatusType.create_default_left_status()

  end

  def create
    flash.clear
    @faculty_member = FacultyMember.new(params[:faculty_member])
    if  (@faculty_member.save)
      flash[:nsuccess] = "Faculty member successfully created."
      redirect_to :action => "index"
    else
      flash[:error] = 'Please enter valid information!'
      render "new"
    end
  end

  def edit
    flash.clear
    @faculty_member = FacultyMember.find_by_user_id(params[:id])
    add_breadcrumb @faculty_member.user.name, '', :only => [:edit, :update]
  end

  def update
    flash.clear
    @faculty_member = FacultyMember.find_by_user_id(params[:id])

    if @faculty_member.update_attributes(params[:faculty_member])
        flash[:success] = "Faculty member successfully updated."
        redirect_to :action => "index"
      else
        flash[:error] = 'Please enter valid information!'
        render "edit"
    end
  end

  def show

    if params[:id] == 'facultymembers'
      redirect_to :action=>'index'
    else
      @facultymember = FacultyMember.find_by_user_id(params[:id])
      add_breadcrumb @facultymember.user.name, ''

      @viewing = params[:viewing]
      prawnto :prawn => { :page_size => 'A4',
                     :left_margin => 50,
                     :right_margin => 50,
                     :top_margin => 80,
                     :bottom_margin => 50},
             :filename => "Faculty-Member-"+@facultymember.user.name+"-CV", :inline => true #or false

      respond_to do |format|
        format.html # show.erb
        format.xml  { render :xml => @facultymember }
        format.pdf { render :layout => false }
      end
    end
  end

  def destroy

    @faculty_member = User.find_by_id(params[:id])
    left_status_id = FacultyMemberStatusType.find_by_name(GlobalConstants::Faculty_Status_Left_Name).id
    @faculty_member.faculty_member.update_attribute(:faculty_member_status_type_id, left_status_id)
    flash[:success] = "Faculty member deleted."
    redirect_to :action => "index"
  end
end
