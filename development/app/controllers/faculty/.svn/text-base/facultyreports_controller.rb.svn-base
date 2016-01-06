class Faculty::FacultyreportsController < ApplicationController

  require 'facultyreporttypes'
  include FacultyReportTypes

  add_breadcrumb 'Faculty Reports','facultyreports'
  
  def new
     #@faculty_members = FacultyMember.all
  end
  
  def index
    @faculty_members = FacultyMember.all
    if (params[:streporttype] == FacultyReportTypes::FACULTY_PROFESSIONAL_INFORMATION)
      @faculty_members_grid = initialize_grid(FacultyMember,
                                              :include=>[:status_type,:designation_type,:user=>[:department]], :name => 'faculty_information_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_information_report')
       export_grid_if_requested('faculty_information_report' => 'faculty_information_report') do
            render(:partial => 'faculty_information_report',
                   :locals => {:faculty_members_grid =>@faculty_members_grid},
                   :layout => false)
       end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_RESEARCH_GRANTS)
      if params[:csfaculty][:id].blank?
        @research_grants_grid = initialize_grid(ResearchGrant.joins(:faculty_member_research_grants)
          .where("faculty_member_research_grants.faculty_member_id = :id
          or research_grants.faculty_member_id=:id",:id=>params[:csfaculty][:id]),
          :include=>[:faculty_member=>[:user=>[:department]]], :name => 'researchGrant_faculty_report',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'researchGrant_faculty_report')
        export_grid_if_requested('researchGrant_faculty_report' => 'researchGrant_faculty_report') do
              render(:partial => 'researchGrant_faculty_report',
                     :locals => {:research_grants_grid =>@research_grants_grid},
                     :layout => false)
        end
      else
        @research_grants_grid = initialize_grid(ResearchGrant.joins(:faculty_member_research_grants)
          .where("faculty_member_research_grants.faculty_member_id = :id
          or research_grants.faculty_member_id=:id",:id=>params[:csfaculty][:id]),
          :include=>[:faculty_member=>[:user=>[:department]]], :name => 'researchGrant_faculty_report',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'researchGrant_faculty_report')
        export_grid_if_requested('researchGrant_faculty_report' => 'researchGrant_faculty_report') do
              render(:partial => 'researchGrant_faculty_report',
                     :locals => {:researchgrant_report =>@research_grants_grid},
                     :layout => false)
        end
     end

    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_PUBLICATIONS)
      if params[:csfaculty][:id].blank?
        @faculty_publications_grid = initialize_grid(UserPublication.joins([:user=>[:faculty_member]])
                                              .where(:user_id=>params[:csfaculty][:id]),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member,:department],:user=>[:faculty_member=>[:designation_type]]], :name => 'faculty_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_publications_report')
        export_grid_if_requested('faculty_publications_report' => 'faculty_publications_report') do
              render(:partial => 'faculty_publications_report',
                       :locals => {:faculty_publications_grid =>@faculty_publications_grid },
                       :layout => false)
        end
        @publication = Publication.new()

      else
        faculty_member = FacultyMember.find_by_id(params[:csfaculty][:id])

        @faculty_publications_grid = initialize_grid(UserPublication.joins([:user=>[:faculty_member,:department]])
                                              .where(:user_id=>faculty_member.user_id),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member,:department],:user=>[:faculty_member=>[:designation_type]]], :name => 'faculty_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_publications_report')
        export_grid_if_requested('faculty_publications_report' => 'faculty_publications_report') do
              render(:partial => 'faculty_publications_report',
                        :locals => {:faculty_publications_grid =>@faculty_publications_grid },
                        :layout => false)
        end
      end

    elsif (params[:streporttype] == FacultyReportTypes::DEPARTMENT_PUBLICATIONS)

         @department_publications_grid = initialize_grid(UserPublication.where("user_publications.user_id != 0 and
                                                                             user_publications.user_id != -1"),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member]], :name => 'department_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'department_publications_report')
          export_grid_if_requested('department_publications_report' => 'department_publications_report') do
              render(:partial => 'department_publications_report',
                 :locals => {:department_publications_grid =>@department_publications_grid},
                 :layout => false)
          end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_PHD_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @phd_supervisions_grid = initialize_grid(Milestone.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'phd_supervision_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'phd_supervision_report')
        export_grid_if_requested('phd_supervision_report' => 'phd_supervision_report') do
              render(:partial => 'phd_supervision_report',
                       :locals => {:phd_supervisions_grid => @phd_supervisions_grid},
                       :layout => false)
        end
      else
        @phd_supervisions_grid = initialize_grid(Milestone.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'phd_supervision_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'phd_supervision_report')
        export_grid_if_requested('phd_supervision_report' => 'phd_supervision_report') do
              render(:partial => 'phd_supervision_report',
                       :locals => {:phd_supervisions_grid => @phd_supervisions_grid},
                       :layout => false)
        end
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_COURSES_REPORT)
      if !params[:csfaculty][:id].blank?
        @faculty_courses_grid = initialize_grid(FacultyCourse.where(:faculty_member_id => params[:csfaculty][:id]),
                                          :include => [:semester,:course], :name => 'faculty_courses_report',:per_page => 40,
                                          :enable_export_to_csv => true, :csv_file_name => 'faculty_courses_report')
        export_grid_if_requested('faculty_courses_report' => 'faculty_courses_report') do
                render(:partial => 'faculty_courses_report',
                       :locals => {:faculty_courses_grid => @faculty_courses_grid},
                       :layout => false)
        end
      else
        @faculty_courses_grid = initialize_grid(FacultyCourse.where(:faculty_member_id => params[:csfaculty][:id]),
                                          :include => [:semester,:course], :name => 'faculty_courses_report',:per_page => 40,
                                          :enable_export_to_csv => true, :csv_file_name => 'faculty_courses_report')
        export_grid_if_requested('faculty_courses_report' => 'faculty_courses_report') do
                render(:partial => 'faculty_courses_report',
                       :locals => {:faculty_courses_grid => @faculty_courses_grid},
                       :layout => false)
        end
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_AWARDS_INFORMATION)
      if !params[:csfaculty][:id].blank?
        @faculty_awards_grid = initialize_grid(FacultyMemberAwardsInformation.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'faculty_awards_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_awards_report')
        export_grid_if_requested('faculty_awards_report' => 'faculty_awards_report') do
                render(:partial => 'faculty_awards_report',
                       :locals => {:faculty_awards_grid => @faculty_awards_grid},
                       :layout => false)
        end
      else
       @faculty_awards_grid = initialize_grid(FacultyMemberAwardsInformation.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'faculty_awards_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_awards_report')
       export_grid_if_requested('faculty_awards_report' => 'faculty_awards_report') do
                render(:partial => 'faculty_awards_report',
                       :locals => {:faculty_awards_grid => @faculty_awards_grid},
                       :layout => false)
       end

      end
     elsif(params[:streporttype] == FacultyReportTypes::FACULTY_MS_THESIS_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @ms_thesis_supervisions_grid = initialize_grid(MsCourse.where(:faculty_member_id => params[:csfaculty][:id]).where(:coursetype => 'Thesis'),
                                              :include => [[:student=>[:user]],
                                                          [:student_semester_part1 => [:semester]],
                                                          [:student_semester_part2 => [:semester]]], :name => 'faculty_ms_thesis_supervision',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_ms_thesis_supervision')
        export_grid_if_requested('faculty_ms_thesis_supervision' => 'faculty_ms_thesis_supervision') do
                render(:partial => 'faculty_ms_thesis_supervision',
                       :locals => {:ms_thesis_supervisions_grid => @ms_thesis_supervisions_grid},
                       :layout => false)
        end
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_MS_PROJECT_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @ms_project_supervisions_grid = initialize_grid(MsCourse.where(:faculty_member_id => params[:csfaculty][:id]).where(:coursetype => 'Project'),
                                              :include => [[:student=>[:user]],
                                                          [:student_semester_part1 => [:semester]],
                                                          [:student_semester_part2 => [:semester]]], :name => 'faculty_ms_project_supervision',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_ms_project_supervision')

        export_grid_if_requested('faculty_ms_project_supervision' => 'faculty_ms_project_supervision') do
                render(:partial => 'faculty_ms_project_supervision',
                       :locals => {:ms_project_supervisions_grid => @ms_project_supervisions_grid},
                       :layout => false)
        end

      end
    end
  end
  
  def create
    if (params[:streporttype] == FacultyReportTypes::FACULTY_PROFESSIONAL_INFORMATION)
      @faculty_members_grid = initialize_grid(FacultyMember,
                                              :include=>[:status_type,:designation_type,:user=>[:department]], :name => 'faculty_information_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_information_report')
            render(:partial => 'faculty_information_report',
                   :locals => {:faculty_members_grid =>@faculty_members_grid},
                   :layout => false)
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_RESEARCH_GRANTS)
      if params[:csfaculty][:id].blank?
        @research_grants_grid = initialize_grid(ResearchGrant.joins(:faculty_member_research_grants)
          .where("faculty_member_research_grants.faculty_member_id = :id
          or research_grants.faculty_member_id=:id",:id=>params[:csfaculty][:id]),
          :include=>[:faculty_member=>[:user=>[:department]]], :name => 'researchGrant_faculty_report',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'researchGrant_faculty_report')

        render(:partial => 'researchGrant_faculty_report',
               :locals => {:research_grants_grid =>@research_grants_grid},
               :layout => false)

      else
        @research_grants_grid = initialize_grid(ResearchGrant.joins(:faculty_member_research_grants)
          .where("faculty_member_research_grants.faculty_member_id = :id
          or research_grants.faculty_member_id=:id",:id=>params[:csfaculty][:id]),
          :include=>[:faculty_member=>[:user=>[:department]]], :name => 'researchGrant_faculty_report',:per_page => 40,
          :enable_export_to_csv => true, :csv_file_name => 'researchGrant_faculty_report')

        render(:partial => 'researchGrant_faculty_report',
               :locals => {:researchgrant_report =>@research_grants_grid},
               :layout => false)
     end

    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_PUBLICATIONS)
      if params[:csfaculty][:id].blank?
        @faculty_publications_grid = initialize_grid(UserPublication.joins([:user=>[:faculty_member]])
                                              .where(:user_id=>params[:csfaculty][:id]),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member,:department],:user=>[:faculty_member=>[:designation_type]]], :name => 'faculty_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_publications_report')

        render(:partial => 'faculty_publications_report',
               :locals => {:faculty_publications_grid =>@faculty_publications_grid },
               :layout => false)

        @publication = Publication.new()
           
      else
        faculty_member = FacultyMember.find_by_id(params[:csfaculty][:id])

        @faculty_publications_grid = initialize_grid(UserPublication.joins([:user=>[:faculty_member,:department]])
                                              .where(:user_id=>faculty_member.user_id),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member,:department],:user=>[:faculty_member=>[:designation_type]]], :name => 'faculty_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_publications_report')

        render(:partial => 'faculty_publications_report',
                :locals => {:faculty_publications_grid =>@faculty_publications_grid },
                :layout => false)
      end

    elsif (params[:streporttype] == FacultyReportTypes::DEPARTMENT_PUBLICATIONS)

         @department_publications_grid = initialize_grid(UserPublication.where("user_publications.user_id != 0 and
                                                                             user_publications.user_id != -1"),
                                              :include=>[:publication=>[:publication_type],:user=>[:faculty_member]], :name => 'department_publications_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'department_publications_report')
          render(:partial => 'department_publications_report',
                 :locals => {:department_publications_grid =>@department_publications_grid},
                 :layout => false)

    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_PHD_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @phd_supervisions_grid = initialize_grid(Milestone.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'phd_supervision_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'phd_supervision_report')
        
        render(:partial => 'phd_supervision_report',
               :locals => {:phd_supervisions_grid => @phd_supervisions_grid},
               :layout => false)
      else
        @phd_supervisions_grid = initialize_grid(Milestone.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'phd_supervision_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'phd_supervision_report')
        
        render(:partial => 'phd_supervision_report',
               :locals => {:phd_supervisions_grid => @phd_supervisions_grid},
               :layout => false)
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_COURSES_REPORT)
      if !params[:csfaculty][:id].blank?
        @faculty_courses_grid = initialize_grid(FacultyCourse.where(:faculty_member_id => params[:csfaculty][:id]),
                                          :include => [:semester,:course], :name => 'faculty_courses_report',:per_page => 40,
                                          :enable_export_to_csv => true, :csv_file_name => 'faculty_courses_report')

        render(:partial => 'faculty_courses_report',
               :locals => {:faculty_courses_grid => @faculty_courses_grid},
               :layout => false)
      else
        @faculty_courses_grid = initialize_grid(FacultyCourse.where(:faculty_member_id => params[:csfaculty][:id]),
                                          :include => [:semester,:course], :name => 'faculty_courses_report',:per_page => 40,
                                          :enable_export_to_csv => true, :csv_file_name => 'faculty_courses_report')

        render(:partial => 'faculty_courses_report',
               :locals => {:faculty_courses_grid => @faculty_courses_grid},
               :layout => false)     
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_AWARDS_INFORMATION)
      if !params[:csfaculty][:id].blank?
        @faculty_awards_grid = initialize_grid(FacultyMemberAwardsInformation.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'faculty_awards_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_awards_report')

        render(:partial => 'faculty_awards_report',
               :locals => {:faculty_awards_grid => @faculty_awards_grid},
               :layout => false)
      else
       @faculty_awards_grid = initialize_grid(FacultyMemberAwardsInformation.where(:faculty_member_id => params[:csfaculty][:id]), :name => 'faculty_awards_report',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_awards_report')

        render(:partial => 'faculty_awards_report',
               :locals => {:faculty_awards_grid => @faculty_awards_grid},
               :layout => false)

      end
     elsif(params[:streporttype] == FacultyReportTypes::FACULTY_MS_THESIS_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @ms_thesis_supervisions_grid = initialize_grid(MsCourse.where(:faculty_member_id => params[:csfaculty][:id]).where(:coursetype => 'Thesis'),
                                              :include => [[:student=>[:user]],
                                                          [:student_semester_part1 => [:semester]],
                                                          [:student_semester_part2 => [:semester]]], :name => 'faculty_ms_thesis_supervision',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_ms_thesis_supervision')
         
        render(:partial => 'faculty_ms_thesis_supervision',
               :locals => {:ms_thesis_supervisions_grid => @ms_thesis_supervisions_grid},
               :layout => false)                                                  
      end
    elsif(params[:streporttype] == FacultyReportTypes::FACULTY_MS_PROJECT_SUPERVISION)
      if !params[:csfaculty][:id].blank?
        @ms_project_supervisions_grid = initialize_grid(MsCourse.where(:faculty_member_id => params[:csfaculty][:id]).where(:coursetype => 'Project'),
                                              :include => [[:student=>[:user]],
                                                          [:student_semester_part1 => [:semester]],
                                                          [:student_semester_part2 => [:semester]]], :name => 'faculty_ms_project_supervision',:per_page => 40,
                                              :enable_export_to_csv => true, :csv_file_name => 'faculty_ms_project_supervision')
                                                        

        render(:partial => 'faculty_ms_project_supervision',
               :locals => {:ms_project_supervisions_grid => @ms_project_supervisions_grid},
               :layout => false)

      end
    end
  end
  
end
