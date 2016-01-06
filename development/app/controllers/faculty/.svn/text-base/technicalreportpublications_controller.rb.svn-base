class Faculty::TechnicalreportpublicationsController < ApplicationController
   require 'publicationshelper'
  include PublicationsHelper

  require 'publicationstatustypes'
  include PublicationTypes

  require 'index_wrapper'
  
  add_breadcrumb 'Techincal Reports','technicalreportpublications'
  add_breadcrumb 'Add Technical Report', '', :only => [:new, :create]
  add_breadcrumb 'Edit Technical Report', '', :only => [:edit, :update]
  add_breadcrumb 'Import Technical Report(s)', '', :only => :import_data
  def index

    
    #retrieve all the technical report publications.
    @technicalreport_publication_wrappers = TechnicalReportPublication.all_wrappers
  end
  
  def new

     @publication = Publication.new
     @publication.build_technical_report_publication
     @departments = Department.all
     @authors = PublicationsHelper::get_faculty_members()
     
  end

  def create
    flash.clear
    @departments = Department.all
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new(params[:publication]) 
    
    if(@publication.save)
      @publication.update_attribute(:publication_type_id, PublicationTypes::TECHNICAL_REPORT_PUBLICATION)
      flash[:success] = "Technical Report publication successfully added."
      redirect_to :controller=>"faculty/technicalreportpublications" ,:action=>"index"
    else
      flash[:error] = 'Please enter valid information!'
      render "new"
    end
  end

  def edit

    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id(params[:id])
    @departments = Department.all
  end

  def update
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id(params[:id])
    @departments = Department.all
    
    
    if @publication.update_attributes(params[:publication])
          flash[:sucsess] = "Techical Report successfully updated."
          redirect_to :controller=>"faculty/technicalreportpublications" ,:action=>"index"
    else
      flash[:error] = 'Please enter valid information!'
      render "edit"
    end
  end
  
  #to show properly , in the view always pass the parent publication id
  def show

    if params[:id] == 'technicalreportpublications'
      redirect_to :action=>'index'
    else
      @technical_report_publication = TechnicalReportPublication.find_by_publication_id(params[:id])
      add_breadcrumb @technical_report_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

   #to delete properly , in the view always pass the parent publication id
  def destroy

    @publication = Publication.find_by_id(params[:id])
    @publication.destroy
    flash[:success] = "Technical report deleted."
    redirect_to :action=>"index"
  end

  def import_data
      flash.clear
      @publication = Publication.new
      @publication.build_technical_report_publication
  end

  def importbibtex
    flash.clear
    @publication = Publication.new(params[:publication])
    @publication.title = "Bibtex"
    total = 0
    if @publication.save
      if !@publication.bibtex.path.blank?
        bib = BibTeX.open File.path(@publication.bibtex.path)

        bib.each do |i|
          if i.type.to_s == 'techreport'
            if (Publication.find_by_title(i.title.to_s)).nil?
              p = Publication.new(params[:publication])
              p.build_technical_report_publication

              # publications details
              p.title = i.title.to_s
              p.abstract = 'Not provided'
              p.publicationyear = i.year.to_s
              p.publication_type_id = PublicationTypes::TECHNICAL_REPORT_PUBLICATION
              # Technical report

              p.technical_report_publication.technicalreportnumber = i.number.to_s
              p.technical_report_publication.department_id = '1'
              aindex = 1
              if !i.author.nil?
                (i.author).each do |a|
                  up = p.user_publications.build
          #        flash[:ss] = i.author.to_s
                  if !(user = User.find_by_name(a.to_s)).blank?
                    up.user_id = user.id
                    up.lumsaffiliation = 1
                    up.affiliation = 'LUMS'
                  else
                    up.user_id = -1
                    up.lumsaffiliation = 0
                    up.affiliation = 'Not provided'
                  end
                  up.authorindex = aindex
                  up.authorname = a.to_s
                  aindex = aindex + 1
                end
                 if p.save!
                    total = total+1
                  end
              else
                p.destroy
              end
            end
          end
        end
      end
       if !(total == 0)
        flash[:success]= total.to_s << " Technical Report(s) successfully added"
        redirect_to :controller=>"faculty/technicalreportpublications" ,:action=>"index"
      else
        flash[:success]= "No new technical report added"
        redirect_to :controller=>"faculty/technicalreportpublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end
  end
end
