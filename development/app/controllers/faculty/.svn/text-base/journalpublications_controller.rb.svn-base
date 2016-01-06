class Faculty::JournalpublicationsController < ApplicationController
  
  require 'publicationshelper'
  include PublicationsHelper
  
  require 'publicationstatustypes'
  include PublicationTypes

  require 'index_wrapper'
  
  add_breadcrumb 'Journal Papers','journalpublications'
  add_breadcrumb 'Add Journal Paper', '', :only => [:new, :create]
  add_breadcrumb 'Edit Journal Paper', '', :only => [:edit, :update]
  add_breadcrumb 'Import Journal Paper(s)', '', :only => :import_data
  def index

    #retrieve all the conference publications.
    @journal_publication_wrappers = JournalPublication.all_wrappers
  end

  def new

     @authors = PublicationsHelper::get_faculty_members()
     @publication =Publication.new
     @publication.build_journal_publication
  end

  def create
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication =Publication.new(params[:publication])
   
    if(@publication.save)
      @publication.update_attribute(:publication_type_id, PublicationTypes::JOURNAL_PUBLICATION)
        flash[:success] = "Journal publication successfully added."
        redirect_to :controller=>"faculty/journalpublications" ,:action=>"index"
      else
        flash[:error] = 'Please enter valid information!'
        render "new"
     end

  end

  #to edit properly , in the view always pass the parent publication id
  def edit

    @authors = PublicationsHelper::get_faculty_members()
    @publication= Publication.find_by_id(params[:id])
  end

  def update
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication =Publication.find_by_id(params[:id])

    if @publication.update_attributes(params[:publication])
          flash[:success] = "Journal publication successfully updated."
          redirect_to :controller=>"faculty/journalpublications" ,:action=>"index"
    else
      flash[:error] = 'Please enter valid information!'
      render "edit"
    end
  end

  #to show properly , in the view always pass the parent publication id
  def show
    flash.clear
    if params[:id] == 'journalpublications'
      redirect_to :action=>'index'
    else
      @journal_publication = JournalPublication.find_by_publication_id(params[:id])
      add_breadcrumb @journal_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

  #to delete properly , in the view always pass the parent publication id
  def destroy

    @publication = Publication.find_by_id(params[:id])
    @publication.destroy
    flash[:success] = "Journal publication  deleted."
    redirect_to :action=>"index"
  end
  
   def import_data
      flash.clear
      @publication = Publication.new
      @publication.build_journal_publication
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
          if i.type.to_s == 'article'
            if (Publication.find_by_title(i.title.to_s)).nil?
              p = Publication.new(params[:publication])
              p.build_journal_publication

              # publications details
              p.title = i.title.to_s
              p.abstract = 'Not provided'
              p.publicationyear = i.year.to_s
              p.publication_type_id = PublicationTypes::JOURNAL_PUBLICATION
  #            p.pages = i.pages.to_s
              # Journal Details
              p.journal_publication.journalname = i.journal.to_s
  #            p.journal_publication.volume = i.volume.to_s
              aindex = 1

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
        flash[:success]= total.to_s << " Journal Paper(s) successfully added"
        redirect_to :controller=>"faculty/journalpublications" ,:action=>"index"
      else
        flash[:success]= "No new journal paper added"
        redirect_to :controller=>"faculty/journalpublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end

  end
end
