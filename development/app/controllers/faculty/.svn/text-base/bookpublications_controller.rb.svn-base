class Faculty::BookpublicationsController < ApplicationController

 require 'publicationshelper'
  include PublicationsHelper

  require 'publicationstatustypes'
  include PublicationTypes

  require 'index_wrapper'

  add_breadcrumb 'Books ','bookpublications'
  add_breadcrumb 'Add Book', '', :only => [:new, :create]
  add_breadcrumb 'Edit Book', '', :only => [:edit, :update]
  add_breadcrumb 'Import Book(s)', '', :only => :import_data

  def index
    
    @book_publication_wrappers = BookPublication.all_wrappers
  end

  def show
    flash.clear
    if params[:id] == 'bookpublications'
      redirect_to :action=>'index'
    else
      @book_publication = BookPublication.find_by_publication_id(params[:id])
      add_breadcrumb @book_publication.publication.title, ''
      @viewing = params[:viewing]
    end
  end

  def new

     @authors = PublicationsHelper::get_faculty_members()
     @publication = Publication.new
     @publication.build_book_publication

  end

  def create
    flash.clear
     @authors = PublicationsHelper::get_faculty_members()
    @publication = Publication.new(params[:publication])
    
    if (@publication.save)
      @publication.update_attribute(:publication_type_id, PublicationTypes::BOOK_PUBLICATION)
      flash[:success] = "Book publication successfully added."
      redirect_to :controller=>"faculty/bookpublications" ,:action=>"index"
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
          flash[:success] = "Book successfully updated."
          redirect_to :controller=>"faculty/bookpublications" ,:action=>"index"
    else
      flash[:error] = 'Please enter valid information!'
      render "edit"
    end
  end
  

  def destroy

   @publication = Publication.find_by_id(params[:id])
   @publication.destroy
   flash[:success] = "Book deleted."
    redirect_to :action => "index"

  end
  def import_data
      flash.clear
      @publication = Publication.new
      @publication.build_book_publication
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
        if i.type.to_s == 'book'
          if (Publication.find_by_title(i.title.to_s)).nil?
            p = Publication.new(params[:publication])
            p.build_book_publication
            p.title = i.title.to_s
            p.abstract = 'Not provided'
            p.publication_type_id =PublicationTypes::BOOK_PUBLICATION
            p.publicationyear = i.year.to_s
            p.book_publication.publishername = i.publisher.to_s
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
        flash[:success]= total.to_s << " Book(s) successfully added"
        redirect_to :controller=>"faculty/bookpublications" ,:action=>"index"
      else
        flash[:success]= "No new book added"
        redirect_to :controller=>"faculty/bookpublications" ,:action=>"index"
      end
      @publication.bibtex = nil
      @publication.destroy
    else
      flash[:error] = "Please enter a valid file format"
      render "import_data"
   end

  end
end