class ProjectConf < ActiveRecord::Base
  has_many :designations,
           :foreign_key=>"project_conf_id",
           :class_name=>"FacultyMemberDesignationType"
   accepts_nested_attributes_for :designations,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :bookstatus,
           :foreign_key=>"project_conf_id",
           :class_name=>"BookStatus"
   accepts_nested_attributes_for :bookstatus,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true
  
  has_many :departments,
           :foreign_key=>"project_conf_id",
           :class_name=>"Department"
   accepts_nested_attributes_for :departments,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :bookchapterstatus,
           :foreign_key=>"project_conf_id",
           :class_name=>"BookChapterStatus"
   accepts_nested_attributes_for :bookchapterstatus,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

 has_many :journalstatus,
           :foreign_key=>"project_conf_id",
           :class_name=>"JournalStatus"
   accepts_nested_attributes_for :journalstatus,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

 has_many :conferencestatus,
           :foreign_key=>"project_conf_id",
           :class_name=>"ConferenceStatus"
   accepts_nested_attributes_for :conferencestatus,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

 has_many :workshopstatus,
           :foreign_key=>"project_conf_id",
           :class_name=>"WorkshopStatus"
   accepts_nested_attributes_for :workshopstatus,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

 has_many :technicalreportstatuses,
           :foreign_key=>"project_conf_id",
           :class_name=>"TechnicalReportStatus"
   accepts_nested_attributes_for :technicalreportstatuses,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :ranks,
           :foreign_key=>"project_conf_id",
           :class_name=>"Rank"
   accepts_nested_attributes_for :ranks,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

   has_many :faculty_statuses,
           :foreign_key=>"project_conf_id",
           :class_name=>"FacultyMemberStatusType"
   accepts_nested_attributes_for :faculty_statuses,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true
  

  has_many :probation_status_types,
           :foreign_key=>"project_conf_id",
           :class_name=>"StudentProbationStatusType"
   accepts_nested_attributes_for :probation_status_types,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true


  has_many :degree_status_types,
           :foreign_key=>"project_conf_id",
           :class_name=>"StudentDegreeStatusType"
   accepts_nested_attributes_for :degree_status_types,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :grade_types,
           :foreign_key=>"project_conf_id",
           :class_name=>"GradeType"
   accepts_nested_attributes_for :grade_types,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :course_statuses,
           :foreign_key=>"project_conf_id",
           :class_name=>"CourseStatus"
   accepts_nested_attributes_for :course_statuses,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :financial_aid_status_types,
           :foreign_key=>"project_conf_id",
           :class_name=>"FinancialAidStatusType"
   accepts_nested_attributes_for :financial_aid_status_types,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true

  has_many :semester_offering_types,
           :foreign_key=>"project_conf_id",
           :class_name=>"SemesterOfferingType"
   accepts_nested_attributes_for :semester_offering_types,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true
  
end
