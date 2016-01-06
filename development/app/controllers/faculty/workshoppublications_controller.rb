class Faculty::WorkshoppublicationsController < ApplicationController

  require 'publicationshelper'
  include PublicationsHelper

  require 'publicationstatustypes'
  include PublicationTypes

  require 'faculty/dateformatting'
  include DateFormatting

  require 'index_wrapper'

  add_breadcrumb 'Workshop papers','workshoppublications'
  add_breadcrumb 'Add Workshop Paper', '', :only => [:new, :create]
  add_breadcrumb 'Edit workshop Paper', '', :only => [:edit, :update]
  add_breadcrumb 'Import Workshop Paper(s)', '', :only => :import_data

  def index

   
    #retrieve all the workshop publications.
    @workshop_publication_wrappers = WorkshopPublication.all_wrappers
  end

  def new

    # To be removed
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new
    @publication.build_workshop_publication
  end

  def create
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new(params[:publication])
    
    if(@publication.save)
      @publication.update_attribute(:publication_type_id, PublicationTypes::WORKSHOP_PUBLICATION)
        flash[:success] = "Workshop publication successfully added."
        redirect_to :controller=>"faculty/workshoppublications" ,:action=>"index"
    else
     flash[:error] = 'Please enter valid information!'
     render "new"
   end
 end

  #to edit properly , in the view always pass the parent publication id
  def edit

    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id(params[:id])
  end

  def update
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id(params[:id])

    #common code has been transferred to the PublicationsHelper module.
    
    if @publication.update_attributes(params[:publication])
          flash[:success] = "Workshop publication successfully updated."
          redirect_to :controller=>"faculty/workshoppublications" ,:action=>"index"
        else
          flash[:error] = 'Please enter valid information!'
          render "edit"
        end
  end

  #to show properly , in the view always pass the parent publication id
  def show
    flash.clear
    if params[:id] == 'workshoppublications'
      redirect_to :action=>'index'
    else
      @workshop_publication = WorkshopPublication.find_by_publication_id(params[:id])
            
      add_breadcrumb @workshop_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

  #to delete properly , in the view always pass the parent publication id
  def destroy

    @publication = Publication.find_by_id(params[:id])
    @publication.destroy
    flash[:success] = "Workshop publication deleted."
    redirect_to :action=>"index"
  end
  def import_data
    flash.clear
      @publication = Publication.new
      @publication.build_workshop_publication
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
          if i.type.to_s == 'proceedings'
            if (Publication.find_by_title(i.title.to_s)).nil?
              p = Publication.new(params[:publication])
              p.build_workshop_publication

              # publications details
              p.title = i.title.to_s
              p.abstract = 'Not provided'
              p.publicationyear = i.year.to_s
              p.publication_type_id = PublicationTypes::WORKSHOP_PUBLICATION

              # Workshop

              p.workshop_publication.workshopname = i.title.to_s
              p.workshop_publication.website = 'www.web.com'
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
        flash[:success]= total.to_s << " Workshop paper(s) successfully added"
        redirect_to :controller=>"faculty/workshoppublications" ,:action=>"index"
      else
        flash[:error]= "No new workshop paper added"
        redirect_to :controller=>"faculty/workshoppublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end
  end
end
