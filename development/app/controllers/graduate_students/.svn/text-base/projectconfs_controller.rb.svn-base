class GraduateStudents::ProjectconfsController < ApplicationController


  def new
    @project_conf = ProjectConf.find_by_id("1")
    if @project_conf.blank? or @project_conf.nil?
      @project_conf = ProjectConf.new
    end
  end
  def create

  end

  def update

    @project_conf = ProjectConf.find_by_id("1")
    error = false;
    if @project_conf.blank? or @project_conf.nil?
      @project_conf = ProjectConf.new(params[:project_conf])
      if !@project_conf.save
        error =  true
      end
    else
      if !@project_conf.update_attributes(params[:project_conf])
        error = true
      end
    end

    if error==true
      render "new"
    else
      redirect_to :action=>"new"
    end
  end

  def index

  end
end
