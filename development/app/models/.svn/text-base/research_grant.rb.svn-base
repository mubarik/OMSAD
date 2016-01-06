require 'dynamicdivconstants'
include DynamicDivConstants

class ResearchGrant < ActiveRecord::Base
  #principle investigator association
  belongs_to :faculty_member
  has_one :milestone
  
  
  has_many :faculty_member_research_grants ,:dependent => :destroy
  has_many :faculty_members, :through => :faculty_member_research_grants
  accepts_nested_attributes_for :faculty_member_research_grants,
                                           :reject_if=> lambda{|a| a[:external_entity_name].blank? and a[:faculty_member_id].blank?},
                                           :allow_destroy => true

  #collaboration association
  has_many :collaborations,
    :dependent => :destroy,
    :foreign_key => "research_grant_id",
    :class_name  => "CollaboratorResearchGrant"
  accepts_nested_attributes_for :collaborations,
                                           :reject_if=> lambda{|a| a[:external_entity_name].blank? and a[:faculty_member_id].blank?},
                                           :allow_destroy=>true

  #team member association.
  has_many :team_members,
    :dependent => :destroy,
    :foreign_key => "research_grant_id",
    :class_name  => "UserResearchGrant"
  accepts_nested_attributes_for :team_members,
                                           :reject_if=> lambda{|a| a[:designation].blank? or a[:user_id].blank?},
                                           :allow_destroy => true
  #inventory association
   has_many :inventories

  #research assistant association
  has_many :research_assistants

  has_many :users, :through => :team_members

  #validates :faculty_member_id ,:presence=> {:message => "Principle investigator is required"}
  validate :validate_principle_investigator

  validates :title ,:presence => { :message => "Title is required." } ,
            :length=>{:maximum => 250},
            :format => { :with => /^[a-zA-Z\d\s]*$/}
  validates :grantnumber, :uniqueness => {:message => " Grant number already exists"},
            :presence=> {:message => "Invalid format"},
            :format => {:with => /^[A-Za-z0-9 ]*$/}
  validates :fundingagency, :presence => {:message => "Funding agency is required"}
  validates :amount, :format =>{:with => /^0*[1-9][0-9]*$/}
  validate :start_must_be_before_end_date

  def start_must_be_before_end_date
    return unless startdate and enddate
    errors.add(:startdate, "Start date must be before end date") unless startdate <= enddate
  end
  def validate_principle_investigator
    if pi_affiliation_type
      if faculty_member.blank?  or faculty_member_id.blank?
        errors.add(:faculty_member_id,"Please select an internal PI")
      end
    else
      if external_pi_name.blank? or external_pi_name.empty?
        errors.add(:external_pi_name,"Please enter the external pi name")
      elsif !external_pi_name.match(/^[a-zA-Z ]+$/)
        errors.add(:external_pi_name,"Only alphabets are allowed")
      end
    end
  end
  def self.all_wrappers
    research_grants = ResearchGrant.all
    research_grant_wrappers = Array.new
    research_grants.each do|research_grant|

      research_grant_wrapper = IndexWrapper.new( research_grant.id,
        'displayPic',
        'penguin.jpg',
        research_grant.title,
        'Grant Number',research_grant.grantnumber ,
        'Principle Investigator',research_grant.pi_name,
        'Funding Agency',research_grant.fundingagency,
        'Amount',research_grant.amount,
        'faculty/researchgrants')

      research_grant_wrappers.push(research_grant_wrapper)
    end

    return research_grant_wrappers.reverse
  end

  def pi_name
    name = "Not provided"
    if pi_affiliation_type
      if !faculty_member.blank? or !faculty_member.nil?
        name = faculty_member.user.name
      end
    else
      if !external_pi_name.blank? or !external_pi_name.empty?
        name = external_pi_name
      end
    end
    return name
  end

  def affiliation_type_string
    name = "No"
    if pi_affiliation_type
      name = "Yes"
    end
    return name
  end
  def team_members_count
    if team_members.blank? or team_members.nil?
      return 0
    end
    return team_members.length
  end

  def co_pi_count
    if faculty_member_research_grants.blank? or faculty_member_research_grants.nil?
      return 0
    end
    faculty_member_research_grants.length
  end

  def collaborator_count
    if collaborations.blank? or collaborations.nil?
      return 0
    end
    collaborations.length
  end
  def external_collaborators
    collaborations.where(:affiliationtype=>DynamicDivConstants::External_Affiliation)
  end

  def internal_collaborators
    collaborations.where(:affiliationtype=>DynamicDivConstants::Internal_Affiliation)
  end

  def external_co_pis
    faculty_member_research_grants.where(:affiliationtype=>DynamicDivConstants::External_Affiliation)
  end

  def internal_co_pis
    faculty_member_research_grants.where(:affiliationtype=>DynamicDivConstants::Internal_Affiliation)
  end

  def self.faculty_yearly_grants(faculty_id,year)
   @grants =  ResearchGrant.joins(:faculty_member_research_grants)
                                                   .where("(faculty_member_research_grants.faculty_member_id = ?
                                                    OR research_grants.faculty_member_id= ?) AND
                                                    ((extract(year from research_grants.startdate) = ? OR extract(year from research_grants.enddate) = ?)
                                                    OR (extract(year from research_grants.startdate) <= ? AND extract(year from research_grants.enddate) >= ?))",
                                                    faculty_id,faculty_id,year,year,year,year)

    return @grants
  end
end
