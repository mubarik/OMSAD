class Inventory::ResearchassistantsController < ApplicationController
  require 'index_wrapper'

  add_breadcrumb 'Research Assistants', 'researchassistants'
  add_breadcrumb 'Add RA', '', :only => [:new, :create]
  add_breadcrumb 'Edit RA','', :only => [:edit, :update]
  
   def index
#        flash.clear
#        add_breadcrumb "All RA's", ''
        @rassistant_list_wrappers = ResearchAssistant.all_wrappers
   end

   def new
     flash.clear
    @researchgrants = ResearchGrant.all
    @facultymembers = FacultyMember.all
    @user = User.new
    @researchassistant = @user.build_research_assistant
   end
  
   def create
     flash.clear
    @user = User.new(params[:user])
    @researchgrants = ResearchGrant.all
    @facultymembers = FacultyMember.all
    if @user.save
      flash[:msgGreen]="Research Assitant added successfully"
      redirect_to :action => "index"
    else
      flash[:msgRed]="Please enter valid information!"
      render "new"
    end
=begin
     @user = User.create_user(params[:name],
                           params[:dateofbirth],
                           params[:gender],
                           params[:address],
                           params[:email],
                           params[:contactnumber],
                           '0'
                          )
      if @user.save
      
          @r_assistant = ResearchAssistant.add_research_assistant(
            @user.id,
            params[:employeeid],
            params[:description]

       )

       
           if @r_assistant.save
               flash[:msgGreen]="Research Assiatnt record successfully saved"
               redirect_to :action => "index"
           else
                  flash[:msgGreen]=""
                  render "new"
           end
       else
              render "new"
      end
=end
   end

   def edit
     flash.clear
     @researchgrants = ResearchGrant.all
     @facultymembers = FacultyMember.all
     @user = User.find_by_id(params[:id])

     if @user.research_assistant.research_grant.blank?
      @user.research_assistant.build_research_grant
    end

     if @user.faculty_member.blank?
      @user.build_faculty_member
    end

   end

   def destroy
      @user=User.find_by_id(params[:id])
      @user.destroy
      flash[:msgGreen]="Research Assistant record successfully deleted"
      redirect_to :action => "index"

   end

   def update
    flash.clear
    @user = User.find_by_id(params[:id])
    @researchgrants = ResearchGrant.all
    @facultymembers = FacultyMember.all
    if @user.update_attributes(params[:user])
        flash[:notice] = "Research Assistant successfully updated."
        redirect_to :action => "index"
      else
        flash[:msgRed]="Please enter valid information!"
        render "edit"
    end
=begin
       @rassistant = ResearchAssistant.find_by_id(params[:id])
       ResearchAssistant.update_rassistant( params[:id], params[:employeeid],params[:description])

        User.update_user(@rassistant.user_id,
                     params[:name],
                     params[:gender],
                     params[:dateofbirth],
                     params[:contactnumber],
                     params[:email],
                     params[:address],
                     '1'
                     )
        flash[:msgGreen]="Research Assistant record successfully updated"
        redirect_to :action => "index"
=end
   end

  def show
    flash.clear
    if params[:id] == 'researchassistants'
      redirect_to :action=>'index'
    else
      @r_assistant = User.find_by_id(params[:id])
      add_breadcrumb @r_assistant.name, ''
      @viewing = params[:viewing]
    end
  end
  def routing
    redirect_to :action=>"index"
  end 
end
