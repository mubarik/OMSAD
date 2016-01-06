class Inventory::UstudentsController < ApplicationController

  require 'index_wrapper'

  add_breadcrumb 'Undergraduate Students', 'ustudents'
  add_breadcrumb 'Add Undergraduate Student', '', :only => [:new, :create]
  add_breadcrumb 'Edit Undergraduate Student','', :only => [:edit, :update]

    def index
#      flash.clear
#      add_breadcrumb "All Undergradute Students", ''
      @ustudent_list_wrappers = Ustudent.all_wrappers
     end

    def new
      flash.clear
      @user = User.new
      @ustudent = @user.build_ustudent
    end

    def create
      flash.clear
      @user = User.new(params[:user])
      if @user.save
        flash[:msgGreen]="Undergraduate Student added successfully"
        redirect_to :action => "index"
      else
        flash[:msgRed]="Please enter valid information!"
        render "new"
      end
    end

   def edit
#     flash.clear
     @user = User.find_by_id(params[:id])

   end

   def destroy
      @user=User.find_by_id(params[:id])
      @user.destroy
      flash[:msgGreen]="Undergraduate Student record successfully deleted"
      redirect_to :action => "index"
   end

   def update
      flash.clear
     @user = User.find_by_id(params[:id])

        if @user.update_attributes(params[:user])
            flash[:notice] = "Undergraduate Student successfully updated."
            redirect_to :action => "index"
          else
            flash[:msgRed]="Please enter valid information!"
            render "edit"
        end
   end

  def show
#    flash.clear
    if params[:id] == 'ustudents'
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
