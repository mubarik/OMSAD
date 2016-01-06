class User < ActiveRecord::Base

  require 'publicationstatustypes'
  #Faculty Module Associations.
  has_one :faculty_member,:dependent=>:destroy
  
  has_many :user_user_types ,:dependent => :destroy
  has_many :user_types,:through=> :user_user_types
  accepts_nested_attributes_for :user_user_types ,:allow_destroy => true

  has_many :user_publications,:dependent => :destroy
  has_many :publications ,:through=>:user_publications
  accepts_nested_attributes_for :user_publications

  belongs_to :department

  #Team Member association
  has_many :user_research_grants,
              :dependent => :destroy
  has_many :research_grants ,:through => :user_research_grants
  accepts_nested_attributes_for :user_research_grants

  #Student Module Associations
  has_one :student, :dependent => :destroy
  accepts_nested_attributes_for :student,:allow_destroy => true

  #Inventory Module Associations
  has_many :inventory_ownership_hists, :dependent => :destroy
  
  has_one :inventory_ownership
  has_one :inventory, :through=> :inventory_ownership
  has_one :location_ownership
  has_one :location, :through=> :location_ownership
  has_one :research_assistant, :dependent => :destroy
           accepts_nested_attributes_for :research_assistant
  has_one :t_assistant, :dependent => :destroy
           accepts_nested_attributes_for :t_assistant
  has_one :ustudent, :dependent => :destroy
           accepts_nested_attributes_for :ustudent
  has_one :astaff, :dependent => :destroy
           accepts_nested_attributes_for :astaff

  #association for TA courses
  has_many :ta_courses, :dependent => :destroy
  has_many :semesters , :through => :ta_courses
  has_many :courses , :through => :ta_courses

  # photo upload association
  has_attached_file :photo
  validates_attachment_content_type :photo,
                                    :content_type => ['image/jpeg', 'image/jpg', 'image/png','image/gif'],
                                    :message => "Invalid image type."
                                                

  validates_attachment_size :photo, :less_than => 5.megabytes,
                            :message => "Photo size cannot be more than 5 MB"
 

  validates :name ,:presence => {:message => "Name cannot be blank."} ,
                   :length=>{:maximum => 30}, :format => { :with => /^[a-zA-Z ]+$/,:message=> "Name cannot have special characters."}

  validates :email, :uniqueness => {:message => " Email already exists"},
                    :presence => { :message => "Email address is required" },
                    :format => {:with => /^[\_]*([a-zA-Z0-9]+(\.|\_*)?)+@([a-zA-Z][a-zA-Z0-9\-]+(\.|\-*\.))+[a-zA-Z]{2,6}$/,
                    :message => "Email is invalid."}
                    
#  validates_format_of :secondaryemail, :with => /^[\_]*([a-z0-9]+(\.|\_*)?)+@([a-z][a-z0-9\-]+(\.|\-*\.))+[a-z]{2,6}$/,
#                      :message => "Email is invalid."

  validates :department_id ,
            :presence => { :message => "Department name is required."}
#  validates_format_of :officenumber,
#                      :with => /^\+(?:[0-9] ?){6,14}[0-9]$/,
#                      :message => "Invalid format of phone number"

  validates_format_of :contactnumber,
                      :with => /^\+(?:[0-9] ?){6,14}[0-9]$/,
                      :message => "Invalid format of phone number"
  def self.all
    User.where("name != 'Default Owner'")
  end

  def self.all_with_owner
    User.where("name = 'Default Owner'") + User.all
  end

  def self.non_faculty_members
    @faculty_members_all = FacultyMember.select(:user_id)

    @facultymembers = Array.new
    @facultymembers.push(0)

    @faculty_members_all.each do|facultymember|
    @facultymembers.push(facultymember.user_id)
    end

    return  User.find(:all, :conditions => ["id NOT IN (?)", @facultymembers])
  end


  def book_publications
    publications.where(:publication_type_id=>PublicationTypes::BOOK_PUBLICATION)
  end

  def book_chapter_publications
    publications.where(:publication_type_id=>PublicationTypes::BOOK_CHAPTER_PUBLICATION)
  end

  def journal_publications
    publications.where(:publication_type_id=>PublicationTypes::JOURNAL_PUBLICATION)
  end

  def conference_publications
    publications.where(:publication_type_id=>PublicationTypes::CONFERENCE_PUBLICATION)
  end

  def workshop_publications
    publications.where(:publication_type_id=>PublicationTypes::WORKSHOP_PUBLICATION)
  end

  def technicalreport_publications
    publications.where(:publication_type_id=>PublicationTypes::TECHNICAL_REPORT_PUBLICATION)
  end



end
