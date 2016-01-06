class Faculty::ConferencepublicationsController < ApplicationController

  require 'publicationshelper'
  include PublicationsHelper
  
  require 'publicationstatustypes'
  include PublicationTypes

  require 'faculty/dateformatting'
  include DateFormatting

  require 'index_wrapper'

  add_breadcrumb 'Conference Papers','conferencepublications'
  add_breadcrumb 'Add Conference Paper', '', :only => [:new, :create]
  add_breadcrumb 'Edit Conference Paper', '', :only => [:edit, :update]
  add_breadcrumb 'Import Conference Paper(s)', '', :only => :import_data

  def index

    #retrieve all the conference publications.
    @conference_publication_wrappers = ConferencePublication.all_wrappers
  end

  def new

    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new
    @publication.build_conference_publication
    @publication.publication_photos.build
  end

  def create
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new(params[:publication])
    if (@publication.save)
      @publication.update_attribute(:publication_type_id, PublicationTypes::CONFERENCE_PUBLICATION)
        flash[:success] = "Conference publication successfully added."
        redirect_to :controller=>"faculty/conferencepublications" ,:action=>"index"
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
   

    if @publication.update_attributes(params[:publication])
      flash[:success] = "Conference publication successfully updated."
      redirect_to :controller=>"faculty/conferencepublications" ,:action=>"index"
    else
      flash[:error] = 'Please enter valid information!'
      render "edit"
    end
  end
 

  #to show properly , in the view always pass the parent publication id
  def show
    flash.clear
    if params[:id] == 'conferencepublications'
      redirect_to :action=>'index'
    else
      @conference_publication = ConferencePublication.find_by_publication_id(params[:id])

      add_breadcrumb @conference_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

  #to delete properly , in the view always pass the parent publication id
  def destroy

    @publication = Publication.find_by_id(params[:id])
    @publication.destroy
    flash[:success] = "Conference publication deleted."
    redirect_to :action => "index"
  end

  def import_data
      flash.clear
      @publication = Publication.new
      @publication.build_book_chapter_publication
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
          if i.type.to_s == 'inproceedings'
            if (Publication.find_by_title(i.title.to_s)).nil?
              p = Publication.new(params[:publication])
              p.build_conference_publication

              # publications details
              p.title = i.title.to_s
              p.abstract = 'Not provided'
              p.publicationyear = i.year.to_s
              p.publication_type_id = PublicationTypes::CONFERENCE_PUBLICATION
    #         Conference
              p.conference_publication.conferencename = i.title.to_s
              p.conference_publication.website = 'www.web.com'

              aindex = 1
              if !i.author.nil?
                (i.author).each do |a|
                  up = p.user_publications.build
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
        flash[:success]= total.to_s << " Conference Paper(s) successfully added"
        redirect_to :controller=>"faculty/conferencepublications" ,:action=>"index"
      else
        flash[:success]= "No new conference paper added"
        redirect_to :controller=>"faculty/conferencepublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end

  end
end