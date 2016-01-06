class Inventory::TassistantsController < ApplicationController
  require 'index_wrapper'

  add_breadcrumb 'Teaching Assistants', 'tassistants'
  add_breadcrumb 'Add TA', '', :only => [:new, :create]
  add_breadcrumb 'Edit TA','', :only => [:edit, :update]

  def index
#    flash.clear
#    add_breadcrumb "All TA's", ''
    @tassistant_list_wrappers = TAssistant.all_wrappers
   end

  def new
    flash.clear
    @user = User.new
    @teacherassistant = @user.build_t_assistant

  end

    def create
    flash.clear
      @user = User.new(params[:user])
    if @user.save
      flash[:msgGreen]="Teacher Assistant added successfully"
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

          @t_assistant = TAssistant.add_teacher_assistant(
            @user.id,
            params[:employeeid],
            params[:description]

       )
        if (@t_assistant.save)
          flash[:msgGreen]="Teacher Assiatnt record successfully saved"
          redirect_to :action => "index"
        else
          render "new"
        end

        
      
      else
        render "new"
      end
=end
   end

   def edit
#     flash.clear
     @user = User.find_by_id(params[:id])
#     @tassistant = TAssistant.find_by_id(params[:id])
   end

   def destroy
      @user=User.find_by_id(params[:id])
      @user.destroy
      flash[:msgGreen]="Teacher Assistant record successfully deleted"
      redirect_to :action => "index"
   end

   def update

      flash.clear
     @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
        flash[:notice] = "Teacher Assiatnt successfully updated."
        redirect_to :action => "index"
      else
        flash[:msgRed]="Please enter valid information!"
        render "edit"
    end

=begin
       assistant = TAssistant.find_by_id(params[:id])
       TAssistant.update_assistant( params[:id], params[:employeeid],params[:description])

        User.update_user(assistant.user_id,
                     params[:name],
                     params[:gender],
                     params[:dateofbirth],
                     params[:contactnumber],
                     params[:email],
                     params[:address],
                     '1'
                     )

        flash[:msgGreen]="Teacher Assiatnt record successfully updated"
        redirect_to :action => "index
=end
   end

  def show
#    flash.clear
    if params[:id] == 'tassistants'
        redirect_to :action=>'index'
    else
      @user = User.find_by_id(params[:id])
      add_breadcrumb @user.name, ''
      @viewing = params[:viewing]
    end
  end
  
  def routing
    redirect_to :action=>"index"
  end

end