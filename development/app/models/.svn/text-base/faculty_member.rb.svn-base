class FacultyMember < ActiveRecord::Base

  require 'publicationstatustypes'
  require 'globalconstants'
  belongs_to :user
  accepts_nested_attributes_for :user,:allow_destroy => true

  #scope to get active faculty members
  #those that have left are not included.

  scope:present_faculty_members,:joins=>[:user,:status_type],
       :conditions=>["faculty_member_status_types.name != '"+GlobalConstants::Faculty_Status_Left_Name+"' and users.name != 'Default Owner'"],
                                :order=>"users.name ASC"

  #faculty member designation
  belongs_to :designation_type,
             :foreign_key=>'faculty_member_designation_type_id',
             :class_name=>'FacultyMemberDesignationType'
  #faculty member status
  belongs_to :status_type,
             :foreign_key=>'faculty_member_status_type_id',
             :class_name =>'FacultyMemberStatusType'
  # association for the principle investigator.
  has_many :principle_research_grants ,
    :foreign_key =>'faculty_member_id' ,
    :class_name=>'ResearchGrant'
  has_many :milestones

  #association for research grant collaborations
  has_many :collaborations,
    :dependent => :destroy,
    :foreign_key=>"faculty_member_id",
    :class_name =>"CollaboratorResearchGrant"
            
  #association for co-principle investigators.
  has_many :faculty_member_research_grants ,
    :dependent => :destroy
  has_many :research_grants ,
    :through =>:faculty_member_research_grants

  #association for faculty courses
  has_many :faculty_courses, :dependent => :destroy
  has_many :semesters , :through => :faculty_courses

  has_many :courses , :through => :faculty_courses

  #association for faculty member's educational information
  has_many :educational_information,
    :dependent=>:destroy,
    :foreign_key=>"faculty_member_id",
    :class_name=>"FacultyMemberEducationalInformation"

  accepts_nested_attributes_for :educational_information,
    :reject_if=> lambda{|a| a[:degree].blank? or a[:university].blank?},
    :allow_destroy => true

  #association for faculty member's job experiences
  has_many :job_experiences,
    :dependent=>:destroy,
    :foreign_key=>"faculty_member_id",
    :class_name=>"FacultyMemberJobExperience"

  accepts_nested_attributes_for :job_experiences,
    :reject_if=> lambda{|a| a[:organizationname].blank?},
    :allow_destroy => true


  #association for faculty member's awards information
  has_many :awards_information,
    :dependent=>:destroy,
    :foreign_key=>"faculty_member_id",
    :class_name=>"FacultyMemberAwardsInformation"

  accepts_nested_attributes_for :awards_information,
    :reject_if=> lambda{|a| a[:title].blank?},
    :allow_destroy => true

  has_many :publications
  has_many :services,
    :dependent=>:destroy,
    :foreign_key=>"faculty_member_id",
    :class_name=>"FacultyMemberService"

  accepts_nested_attributes_for :services,
                                :reject_if => lambda{|a| a[:universityservices].blank? and a[:outsideservices].blank? and a[:advisoryroles].blank? and a[:statement].blank?},
                                :allow_destroy => true

  #association for inter-disciplinary collaborators
  has_many :inter_disciplinary_collaborators,
    :dependent =>:destroy,
    :foreign_key => "faculty_member_id",
    :class_name => "FacultyMemberCollaborator"

  accepts_nested_attributes_for :inter_disciplinary_collaborators,
    :reject_if => lambda{|a| a[:name].blank?},
    :allow_destroy => true

  # cv upload association
  has_attached_file :cv
  validates_attachment_size :cv, :less_than => 10.megabytes
  validates_attachment_content_type :cv,
                                    :content_type => ['application/msword','application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
                                    :message => "Invalid document type."

  #research assistant association
  has_many :research_assistants

  has_many :cosupervisor,:dependent => :destroy

  validates :designation ,:presence =>{:message=> "Designation cannot be blank"},
    :format => { :with => /^[a-zA-Z ]+$/,:message => "Designation cannot have special characters."}

  validate :dob_must_be_before_joining_date
  
  def dob_must_be_before_joining_date
    if !joiningdate.blank? and !user.dateofbirth.blank?
      if joiningdate <= user.dateofbirth
        errors.add(:joiningdate, "Date of birth must be before joining date")
      end
    end
  end
  def self.all
    FacultyMember.joins(:user).where("users.name != 'Default Owner'")
  end

  def designation
    if !designation_type.blank? and !designation_type.nil?
      return designation_type.name
    end
    return "Not Provided"
  end

  def status
    if !status_type.blank? or !status_type.nil?
      return status_type.name
    end
    return "Not Provided"
  end
  
  def username
    user.name
  end

  def self.bibliotext(path)
  end

  def research_grant_count
    principle_research_grants.length + faculty_member_research_grants.length
  end

  def self.all_wrappers

    faculty_members = FacultyMember.present_faculty_members
   
    faculty_member_wrappers = Array.new
    faculty_members.each do|faculty_member|
      if !faculty_member.user.photo_file_name.nil?
        photo = faculty_member.user.photo
      else
        if faculty_member.user.gender == 'Male'
          photo = 'user.png'
        else
          photo= 'female_user.png'
        end
      end
      faculty_member_wrapper = IndexWrapper.new( faculty_member.user.id,
        'profilePicture',
        photo,
        faculty_member.user.name,
        'Designation',faculty_member.designation ,
        'Home Address',faculty_member.user.address,
        'Email Address',faculty_member.user.email,
        'Contact Number',faculty_member.user.contactnumber,
        'faculty/facultymembers')

      faculty_member_wrappers.push(faculty_member_wrapper)
    end
    return faculty_member_wrappers
  end


  
end
