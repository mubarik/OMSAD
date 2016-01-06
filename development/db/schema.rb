# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120715162801) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.string   "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "student_semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "astaffs", :force => true do |t|
    t.integer  "user_id"
    t.string   "employee_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_chapter_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "bookname"
    t.string   "publishername"
    t.text     "editors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_chapter_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "book_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "publishername"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "collaborator_research_grants", :force => true do |t|
    t.integer  "faculty_member_id"
    t.integer  "research_grant_id"
    t.string   "collaboratorname"
    t.string   "affiliationname"
    t.boolean  "affiliationtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conference_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "conferencename"
    t.string   "website"
    t.string   "rank"
    t.date     "conferencestartdate"
    t.date     "conferenceenddate"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "acceptancerate"
    t.string   "year"
    t.string   "reference"
    t.string   "referenceweb"
    t.integer  "rank_id"
  end

  create_table "conference_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "cosupervisors", :force => true do |t|
    t.integer  "ms_course_id"
    t.integer  "milestone_id"
    t.integer  "faculty_member_id"
    t.boolean  "affiliationwithlums"
    t.string   "cosupervisorname"
    t.string   "email"
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "independent_study_id"
    t.string   "cotype"
  end

  create_table "course_assets", :force => true do |t|
    t.integer  "student_course_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.string   "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_statuses", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "coursetype"
    t.string   "coursename"
    t.string   "coursecode"
    t.integer  "credithrs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cpus", :force => true do |t|
    t.integer  "inventory_id"
    t.string   "processorname"
    t.integer  "numberofcores"
    t.integer  "numberofthreads"
    t.string   "cpumemory"
    t.string   "hard_disk"
    t.string   "dvdrom"
    t.string   "cdrom"
    t.string   "keyboard"
    t.string   "mouse"
    t.string   "sound_card"
    t.string   "vga"
    t.string   "ram"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.integer  "school_id",       :default => 1
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "examinations", :force => true do |t|
    t.integer  "milestone_id"
    t.string   "examinationname"
    t.string   "examinationstatus"
    t.date     "examinationdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_courses", :force => true do |t|
    t.integer  "faculty_member_id"
    t.integer  "noofstudents"
    t.float    "contribution"
    t.string   "sharedstatus"
    t.string   "offering"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
    t.integer  "course_id"
  end

  create_table "faculty_member_awards_informations", :force => true do |t|
    t.integer  "faculty_member_id"
    t.string   "title"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_member_collaborators", :force => true do |t|
    t.string   "name"
    t.string   "affiliation"
    t.string   "description"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "faculty_member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_member_designation_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "faculty_member_educational_informations", :force => true do |t|
    t.integer  "faculty_member_id"
    t.string   "degree"
    t.string   "university"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_member_job_experiences", :force => true do |t|
    t.integer  "faculty_member_id"
    t.string   "organizationname"
    t.string   "designation"
    t.string   "from_year"
    t.string   "to_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculty_member_research_grants", :force => true do |t|
    t.integer  "faculty_member_id"
    t.integer  "research_grant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "copiname"
    t.string   "affiliationname"
    t.boolean  "affiliationtype"
  end

  create_table "faculty_member_services", :force => true do |t|
    t.integer  "faculty_member_id"
    t.string   "universityservices"
    t.string   "outsideservices"
    t.string   "advisoryroles"
    t.string   "statement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "faculty_member_status_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "faculty_members", :force => true do |t|
    t.integer  "user_id"
    t.text     "biography"
    t.text     "awardsinfo"
    t.text     "academicrecords"
    t.text     "researchinterests"
    t.text     "jobexperiences"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.integer  "faculty_member_status_type_id",      :default => 1
    t.integer  "faculty_member_designation_type_id", :default => 1
    t.date     "joiningdate"
  end

  create_table "filestudents", :force => true do |t|
    t.string   "name"
    t.string   "dob"
    t.string   "gender"
    t.string   "department"
    t.string   "address"
    t.string   "contactno"
    t.string   "email"
    t.string   "usertype"
    t.string   "rollno"
    t.string   "credithrs"
    t.string   "financialaid"
    t.string   "cgpa"
    t.string   "degreelevel"
    t.string   "probation"
    t.string   "currentstatus"
    t.string   "admission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filestudentsemesters", :force => true do |t|
    t.string   "studentid"
    t.string   "offering"
    t.string   "year"
    t.string   "coursecode"
    t.string   "coursename"
    t.string   "gpa"
    t.string   "grade"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_aid_status_types", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_aids", :force => true do |t|
    t.integer  "student_id"
    t.float    "amount"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_semester_id"
    t.integer  "financial_aid_status_type_id", :default => 1
  end

  create_table "financial_assets", :force => true do |t|
    t.integer  "financial_aid_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.string   "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_types", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "independent_studies", :force => true do |t|
    t.integer  "student_id"
    t.integer  "faculty_member_id"
    t.integer  "student_semester_id"
    t.string   "studycode"
    t.string   "studytitle"
    t.integer  "studycredithrs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grade_type_id",       :default => 1
  end

  create_table "inventories", :force => true do |t|
    t.string   "inventoryname"
    t.string   "description"
    t.integer  "inventory_type_id"
    t.string   "brand"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory_status_id"
    t.integer  "barcode"
    t.date     "acqdate"
    t.integer  "research_grant_id"
    t.string   "attribute1"
    t.string   "attribute2"
    t.string   "attribute3"
    t.string   "attribute4"
    t.string   "attribute5"
  end

  create_table "inventory_locations", :force => true do |t|
    t.integer  "inventory_id"
    t.integer  "room_detail_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_ownership_hists", :force => true do |t|
    t.integer  "inventory_id"
    t.integer  "user_id"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ownership_type"
  end

  create_table "inventory_ownerships", :force => true do |t|
    t.integer  "inventory_id"
    t.integer  "user_id"
    t.integer  "external_user_id"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usertype"
    t.integer  "ownership_type"
  end

  create_table "inventory_statuses", :force => true do |t|
    t.string   "inventorystatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_types", :force => true do |t|
    t.string   "inventorytypename"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventoryfiles", :force => true do |t|
    t.string   "inventory_type"
    t.string   "inventory_id"
    t.string   "barcode"
    t.string   "inventory_status"
    t.string   "brand"
    t.string   "model"
    t.string   "department"
    t.string   "sn"
    t.string   "grn"
    t.string   "ram"
    t.string   "rom"
    t.string   "processor"
    t.string   "cores"
    t.string   "threads"
    t.string   "memory"
    t.string   "harddisk"
    t.string   "dvdrom"
    t.string   "cdrom"
    t.string   "keyboard"
    t.string   "mouse"
    t.string   "soundcard"
    t.string   "vga"
    t.string   "speed"
    t.string   "mediatype"
    t.string   "technology"
    t.string   "resolution"
    t.string   "scansize"
    t.string   "fileformat"
    t.string   "scannertype"
    t.string   "lcdtype"
    t.string   "screensize"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attribute1"
    t.string   "attribute2"
    t.string   "attribute3"
    t.string   "attribute4"
    t.string   "attribute5"
  end

  create_table "journal_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "journalname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "volume"
    t.float    "impactfactor"
    t.integer  "issuenumber"
    t.string   "year"
    t.string   "reference"
    t.string   "referenceweb"
  end

  create_table "journal_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "lcds", :force => true do |t|
    t.string   "lcdtype"
    t.string   "resolution"
    t.string   "size"
    t.integer  "inventory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_ownership_hists", :force => true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_ownerships", :force => true do |t|
    t.integer  "user_id"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "location_types", :force => true do |t|
    t.string   "locationtypename"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "locationname"
    t.string   "description"
    t.integer  "room_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "student_id"
    t.string   "cosupervisor"
    t.date     "proposalsubmission"
    t.date     "firstqualifier"
    t.date     "secondqualifier"
    t.date     "thesisdefence"
    t.string   "title"
    t.text     "supervisorcomments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_member_id"
    t.string   "qualifierstatus"
    t.string   "gre"
    t.string   "panelone"
    t.string   "paneltwo"
    t.string   "panelthree"
    t.string   "granttype"
    t.string   "grantname"
    t.string   "grantstatus"
    t.integer  "research_grant_id"
  end

  create_table "ms_courses", :force => true do |t|
    t.integer  "student_id"
    t.integer  "faculty_member_id"
    t.integer  "student_semester1_id"
    t.integer  "student_semester2_id"
    t.string   "coursetype"
    t.string   "title"
    t.date     "proposaldefencedate"
    t.date     "thesisdefencedate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phd_reports", :force => true do |t|
    t.integer  "milestone_id"
    t.string   "reportname"
    t.string   "reporttype"
    t.string   "reportstatus"
    t.date     "reportdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printers", :force => true do |t|
    t.string   "technology"
    t.string   "speed"
    t.string   "memory"
    t.string   "mediatype"
    t.integer  "inventory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_confs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposal_committees", :force => true do |t|
    t.integer  "milestone_id"
    t.integer  "faculty_member_id"
    t.boolean  "affiliationwithlums"
    t.string   "cosupervisorname"
    t.string   "email"
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_photos", :force => true do |t|
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "publication_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.text     "abstract"
    t.integer  "publication_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "publicationyear"
    t.string   "publicationstatus"
    t.text     "keywords"
    t.string   "doi"
    t.string   "pages"
  end

  create_table "ranks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "research_assistants", :force => true do |t|
    t.integer  "user_id"
    t.string   "employee_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_member_id"
    t.integer  "research_grant_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "research_grants", :force => true do |t|
    t.string   "title"
    t.string   "grantnumber"
    t.text     "description"
    t.string   "fundingagency"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "amount"
    t.integer  "faculty_member_id"
    t.text     "partners"
    t.text     "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pi_affiliation_type",     :default => true
    t.string   "external_pi_name"
    t.string   "external_pi_affiliation"
  end

  create_table "room_details", :force => true do |t|
    t.string   "roomnumber"
    t.integer  "location_type_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roomname"
  end

  create_table "roomdetailmaps", :force => true do |t|
    t.integer  "room_detail_id"
    t.integer  "map_location_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scanners", :force => true do |t|
    t.string   "scannertype"
    t.string   "resolution"
    t.string   "scansize"
    t.string   "fileformate"
    t.integer  "inventory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semester_courses", :force => true do |t|
    t.integer  "semester_id"
    t.integer  "course_id"
    t.integer  "prerequisite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semester_offering_types", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", :force => true do |t|
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_offering_type", :default => 1
  end

  create_table "student_courses", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "semester_id"
    t.float    "coursegpa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grade_type_id",    :default => 1
    t.integer  "course_status_id", :default => 1
  end

  create_table "student_degree_status_types", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_grants", :force => true do |t|
    t.integer  "milestone_id"
    t.date     "fundingmonth"
    t.float    "totalamount"
    t.float    "usedamount"
    t.float    "remainingamount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_probation_status_types", :force => true do |t|
    t.string   "name"
    t.integer  "project_conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_semesters", :force => true do |t|
    t.integer  "student_id"
    t.integer  "semester_id"
    t.float    "semestergpa"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "semesterexception_file_name"
    t.string   "semesterexception_content_type"
    t.integer  "semesterexception_file_size"
    t.datetime "semesterexception_updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.string   "rollno"
    t.integer  "credithrstaken"
    t.string   "financialaidstatus"
    t.float    "cgpa"
    t.string   "degreelevel"
    t.string   "degreetype"
    t.integer  "currentsemester"
    t.date     "admissiondate"
    t.date     "graduationdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_probation_status_type_id", :default => 1
    t.integer  "student_degree_status_type_id",    :default => 1
  end

  create_table "t_assistants", :force => true do |t|
    t.integer  "user_id"
    t.string   "employee_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.float    "evalgpa"
  end

  create_table "ta_courses", :force => true do |t|
    t.integer  "semester_id"
    t.integer  "integer"
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.float    "evalgpa"
  end

  create_table "technical_report_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "technicalreportnumber"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technical_report_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

  create_table "thesis_committees", :force => true do |t|
    t.integer  "milestone_id"
    t.integer  "faculty_member_id"
    t.boolean  "affiliationwithlums"
    t.string   "cosupervisorname"
    t.string   "email"
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_publications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.string   "authorname"
    t.integer  "authorindex"
    t.boolean  "lumsaffiliation"
    t.string   "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_research_grants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "research_grant_id"
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "teamstartdate"
    t.date     "teamenddate"
  end

  create_table "user_types", :force => true do |t|
    t.string   "typename"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_user_types", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.date     "dateofbirth"
    t.string   "gender"
    t.integer  "department_id"
    t.string   "address"
    t.string   "contactnumber"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secondaryemail"
    t.string   "officenumber"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "ustudents", :force => true do |t|
    t.integer  "user_id"
    t.string   "employee_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workshop_publications", :force => true do |t|
    t.integer  "publication_id"
    t.string   "workshopname"
    t.string   "conferencename"
    t.string   "website"
    t.date     "workshopstartdate"
    t.date     "workshopenddate"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "conferencewebsite"
  end

  create_table "workshop_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_conf_id"
  end

end
