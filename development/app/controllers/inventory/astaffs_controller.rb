class Inventory::AstaffsController < ApplicationController
  require 'index_wrapper'

  add_breadcrumb 'Administrative Staff', 'astaffs'
  add_breadcrumb 'Add Administrative Staff', '', :only => [:new, :create]
  add_breadcrumb 'Edit Administrative Staff','', :only => [:edit, :update]

  def index
#    flash.clear
#    add_breadcrumb "All Administrative Staff", ''
    @astaff_list_wrappers = Astaff.all_wrappers
  end

  def new
    flash.clear
    @user = User.new
    @astaff = @user.build_astaff
  end

  def create
    flash.clear
    @user = User.new(params[:user])
    if @user.save
      flash[:msgGreen]="Administrative Staff added successfully"
      redirect_to :action => "index"
    else
      flash[:msgRed]="Please enter valid information!"
      render "new"
    end
  end

  def edit
    flash.clear
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user=User.find_by_id(params[:id])
    @user.destroy
    flash[:msgGreen]="Administrative Staff record successfully deleted"
    redirect_to :action => "index"
  end

  def update
    flash.clear
    @user = User.find_by_id(params[:id])
      if @user.update_attributes(params[:user])
          flash[:notice] = "Administrative Staff successfully updated."
          redirect_to :action => "index"
        else
          flash[:msgRed]="Please enter valid information!"
          render "edit"
      end
  end

  def show
    flash.clear
    if params[:id] == 'astaffs'
        redirect_to :action=>'index'
    else
      @astaff = User.find_by_id(params[:id])
      add_breadcrumb @astaff.name, ''
    end
  end
  def routing
    redirect_to :action=>"index"
  end

end
