class Faculty::PublicationsController < ApplicationController

  require 'publicationshelper'
  include PublicationsHelper

  require 'publicationstatustypes'
  include PublicationTypes

  def new
     @departments = Department.all
     @authors = PublicationsHelper::get_faculty_members()
  end
  
  def create
#      Conference Publication

     if (params[:cbpublication_type_id] == "Conference Publication")
       publication=PublicationsHelper::insert_publication(params, PublicationTypes::CONFERENCE_PUBLICATION)
       if (publication.save)
         conference = ConferencePublication.create_conference_publication(publication,
                                                        params[:txconferencename],
                                                        params[:txconferencewebsite],
                                                        params[:txconferencerank],
                                                        params[:txconferencestartdate],
                                                        params[:txconferenceenddate],
                                                        params[:txconferenceacceptancerate],
                                                        params[:txconferencecity])
        if(conference.save)
          flash[:notice] = "Conference publication successfully added."
          redirect_to :controller=>"faculty/conferencepublications" ,:action=>"index"
        else
          flash[:conferencename] = conference.errors[:conferencename]
          flash[:website] = conference.errors[:website]
          flash[:date] = conference.errors[:conferencestratdate]
          flash[:acceptancerate] =  conference.errors[:acceptancerate]
          Publication.delete_publication(publication.id)
          redirect_to :controller=>"faculty/publications" ,:action=>"new"
        end
       else
         flash[:title] = publication.errors[:title]
         flash[:publicationyear] = publication.errors[:publicationyear]
         flash[:publicationstatus] = publication.errors[:status]
         redirect_to :controller=>"faculty/publications" ,:action=>"new"
       end

#      Journal Publication

  


#       Workshop Publication

      elsif (params[:cbpublication_type_id] == "Workshop Publication")
        publication=PublicationsHelper::insert_publication(params, PublicationTypes::WORKSHOP_PUBLICATION)
        if(publication.save)
          workshop = WorkshopPublication.create_workshop_publication(publication,
                                                      params[:txworkshopname],
                                                      params[:txworkshopconference],
                                                      params[:txworkshopwebsite],
                                                      params[:txworkshopstartdate],
                                                      params[:txworkshopenddate],
                                                      params[:txworkshopcity])

          if(workshop.save)
            flash[:notice] = "Workshop publication successfully added."
            redirect_to :controller=>"faculty/workshoppublications" ,:action=>"index"
          else
            Publication.delete_publication(publication.id)
            flash[:workshopname] = workshop.errors[:workshopname]
            flash[:workshopconferencename] = workshop.errors[:conferencename]
            flash[:website] = workshop.errors[:website]
            flash[:workshopdate] = workshop.errors[:workshopstartdate]
            flash[:workshopcity] = workshop.errors[:city]
            redirect_to :controller=>"faculty/publications" ,:action=>"new"
          end
        else
          flash[:title] = publication.errors[:title]
          flash[:publicationyear] = publication.errors[:publicationyear]
          flash[:publicationstatus] = publication.errors[:status]
          redirect_to :controller=>"faculty/publications" ,:action=>"new"
        end

      
#       Technical Report Publication

     elsif (params[:cbpublication_type_id] == "Technical Report Publication")
       publication=PublicationsHelper::insert_publication(params, PublicationTypes::TECHNICAL_REPORT_PUBLICATION)
       if(publication.save)
         technicalreport = TechnicalReportPublication.create_technical_report_publication(publication,
                                                        params[:txtechnicalreportnumber],
                                                        params[:department][:id])
         if(technicalreport.save)
            flash[:notice] = "Technical Report publication successfully added."
            redirect_to :controller=>"faculty/technicalreportpublications" ,:action=>"index"
         else
           Publication.delete_publication(publication.id)
           flash[:reportnumber] = technicalreport.errors[:technicalreportnumber]
           redirect_to :controller=>"faculty/publications" ,:action=>"new"
         end
       else
         flash[:title] = publication.errors[:title]
         flash[:publicationyear] = publication.errors[:publicationyear]
         flash[:publicationstatus] = publication.errors[:status]
         redirect_to :controller=>"faculty/publications" ,:action=>"new"
       end
    end
  end
end
