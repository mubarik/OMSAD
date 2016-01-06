class Faculty::BookchapterpublicationsController < ApplicationController

  require 'publicationshelper'
  include PublicationsHelper

  require 'publicationstatustypes'
  include PublicationTypes

  require 'index_wrapper'

  add_breadcrumb 'Book Chapters','bookchapterpublications'
  add_breadcrumb 'Edit Book Chapter', '', :only => [:edit, :update]
  add_breadcrumb 'Add Book Chapter', '', :only => [:new, :create]
  add_breadcrumb 'Import Book Chapter(s)', '', :only => :import_data
  def index
   
    @book_chapter_publication_wrappers = BookChapterPublication.all_wrappers
  end

  def show
    flash.clear
    if params[:id] == 'bookchapterpublications'
      redirect_to :action=>'index'
    else
      @bookchapter_publication = BookChapterPublication.find_by_publication_id(params[:id])
      add_breadcrumb @bookchapter_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

  def new

    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new
    @publication.build_book_chapter_publication
  end

  def create
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new(params[:publication])

    if (@publication.save)
        @publication.update_attribute(:publication_type_id, PublicationTypes::BOOK_CHAPTER_PUBLICATION)        
        flash[:success] = "Book Chapter publication successfully added."
        redirect_to :controller=>"faculty/bookchapterpublications" ,:action=>"index"
    else
       flash[:error] = 'Please enter valid information!'
      render "new"
    end
  end


  def edit

    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id (params[:id])
  end

  def update
    flash.clear
    @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.find_by_id (params[:id])
       
    if @publication.update_attributes(params[:publication])
          flash[:success] = "Book chapter successfully updated."
          redirect_to :controller=>"faculty/bookchapterpublications" ,:action=>"index"
    else
       flash[:error] = 'Please enter valid information!'
      render "edit"
    end
  end

  def destroy

    @publication = Publication.find_by_id(params[:id])
    @publication.destroy
    flash[:success] = "Book chapter deleted."
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
         if i.type.to_s == 'inbook'
          if (Publication.find_by_title(i.title.to_s)).nil?
            p = Publication.new(params[:publication])
            p.build_book_chapter_publication
            # publications details
            p.title = i.title.to_s
            p.abstract = 'Not provided'
            p.publicationyear = i.year.to_s
            p.publication_type_id = PublicationTypes::BOOK_CHAPTER_PUBLICATION
            # Book Chapter

  #          p.book_chapter_publication.bookname = i.booktitle.to_s
            p.book_chapter_publication.publishername = i.publisher.to_s
            p.book_chapter_publication.editors = 'Not Provided'
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
        flash[:success]= total.to_s << " Book Chapter(s) successfully added"
        redirect_to :controller=>"faculty/bookchapterpublications" ,:action=>"index"
      else
        flash[:success]= "No new book chapters added"
        redirect_to :controller=>"faculty/bookchapterpublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end
     
  end
end
