class Faculty::ResearchgrantsController < ApplicationController

  require 'dynamicdivconstants'
  include DynamicDivConstants

  require 'index_wrapper'
  add_breadcrumb 'Research Grants','researchgrants'
  add_breadcrumb 'Add Research Grant', '', :only => [:new, :create]
  add_breadcrumb 'Edit Research Grant', '', :only => [:edit, :update]

  def index

    @research_grant_wrappers = ResearchGrant.all_wrappers
    @controller = "faculty/researchgrants"
  end

  def new

    @faculty_members = FacultyMember.all
    @user = User.non_faculty_members

    @research_grant  = ResearchGrant.new
    @research_grant.build_faculty_member
  end

  def create
    flash.clear
    @research_grant = ResearchGrant.new(params[:research_grant])
    @user = User.non_faculty_members
    if (@research_grant.save)
      flash[:success]  = "Research Grant successfully added."
      redirect_to :action => "index"
    else
      flash[:error]  = "'Please enter valid information!'"
      render "new"
    end
  end

  def show
    flash.clear
    if params[:id] == 'researchgrants'
      redirect_to :action=>'index'
    else
      @researchgrant = ResearchGrant.find_by_id(params[:id])
      @external_co_pis = @researchgrant.faculty_member_research_grants.where(:affiliationtype=>DynamicDivConstants::External_Affiliation)
      @internal_co_pis = @researchgrant.faculty_member_research_grants.where(:affiliationtype=>DynamicDivConstants::Internal_Affiliation)

      add_breadcrumb @researchgrant.title, ''
      @viewing = params[:viewing]
    end
  end

  def edit

    @user = User.non_faculty_members
    
    @faculty_members = FacultyMember.all
    @research_grant = ResearchGrant.find_by_id(params[:id])
    if @research_grant.faculty_member.blank?
      @research_grant.build_faculty_member
    end
  end

  def update
    flash.clear
    @research_grant = ResearchGrant.find_by_id(params[:id])
    

    @user = User.non_faculty_members()

    if@research_grant.update_attributes(params[:research_grant])
      flash[:success]  = "Research Grant successfully updated."
      redirect_to :action => "index"
    else
      flash[:error]  = "'Please enter valid information!'"
      render "edit"
    end
  end

  def destroy

    @research_grant = ResearchGrant.find_by_id(params[:id])
    @research_grant.destroy
    flash[:success]  = "Research Grant deleted."
    redirect_to :action => "index"
  end
end
