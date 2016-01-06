class Faculty::ScholarlyreportController < ApplicationController

  add_breadcrumb 'Scholarly Report', ''
  def index
    @faculty_members = FacultyMember.all
  end

  def create
     @facultycourses = FacultyCourse.faculty_courses_report(params[:faculty][:id],params[:year])

     @inter_disciplinary_collaborations = FacultyMemberCollaborator.faculty_collaboration(params[:faculty][:id],params[:year])

    faculty_member = FacultyMember.find_by_id(params[:faculty][:id])
    @faculty_publications  = UserPublication.joins(:publication).where("user_publications.user_id = " +faculty_member.user_id.to_s + " and publications.publicationyear = " + params[:year],
                                                      :include=>[:publication =>[:publication_type]])

    @faculty_awards = FacultyMemberAwardsInformation.where(:faculty_member_id => params[:faculty][:id],:year => params[:year])

    @faculty_research_grants = ResearchGrant.faculty_yearly_grants(params[:faculty][:id],params[:year])

    @phd_supervisions = Milestone.yearly_phd_supervision(params[:faculty][:id],params[:year])

    @ms_thesis_supervisions = MsCourse.yearly_thesis_supervision(params[:faculty][:id],params[:year])

    @ms_project_supervisions = MsCourse.yearly_project_supervision(params[:faculty][:id],params[:year])

    @faculty_services = FacultyMemberService.yearly_services(params[:faculty][:id],params[:year])

        render(:partial => 'faculty_scholarly_report',
               :locals => {:faculty_yearly_courses => @facultycourses,
               :faculty_inter_disciplinary_collaboration => @inter_disciplinary_collaborations,
               :faculty_publications_report => @faculty_publications,
               :faculty_awards => @faculty_awards,
               :faculty_research_grants => @faculty_research_grants,
               :phd_supervision =>@phd_supervisions,
               :ms_thesis_supervision =>@ms_thesis_supervisions,
               :ms_project_supervision => @ms_project_supervisions,
               :services => @faculty_services},
               :layout => false)
  end

  def show
     faculty_id = params[:id].split("&").first.split("=").last.to_s
     year = params[:id].split("&").last.split("=").last.to_s

    @faculty_member = FacultyMember.find_by_id(faculty_id)
    @facultycourses = FacultyCourse.faculty_courses_report(faculty_id,year)

    @inter_disciplinary_collaborations = FacultyMemberCollaborator.faculty_collaboration(faculty_id,year)

    user_id = FacultyMember.find_by_id(faculty_id).user_id
    user_id = user_id.to_s
    @faculty_publications  = UserPublication.joins(:publication).where("user_publications.user_id = " + user_id + " and publications.publicationyear = " + year,
                                                      :include=>[:publication =>[:publication_type]])

    @faculty_awards = FacultyMemberAwardsInformation.where("faculty_member_id = " + faculty_id + " and year = " + year)

    @faculty_research_grants = ResearchGrant.faculty_yearly_grants(faculty_id,year)

    @phd_supervisions = Milestone.yearly_phd_supervision(faculty_id,year)

    @ms_thesis_supervisions = MsCourse.yearly_thesis_supervision(faculty_id,year)

    @ms_project_supervisions = MsCourse.yearly_project_supervision(faculty_id,year)

    @faculty_services = FacultyMemberService.yearly_services(faculty_id,year)



     prawnto :prawn => { :page_size => 'A4',
                 :left_margin => 50,
                 :right_margin => 50,
                 :top_margin => 80,
                 :bottom_margin => 50},
                 :filename => "Scholarly Report", :inline => true #or false

      respond_to do |format|
        format.html # show.erb
        format.xml  { render :xml =>[@faculty_member,@facultycourses,@inter_disciplinary_collaborations,@faculty_publications,
                                     @faculty_awards,@faculty_research_grants,@phd_supervisions, @ms_thesis_supervisions,
                                     @ms_project_supervisions, @faculty_services] }
        format.pdf { render :layout => false }
      end
  end
end
