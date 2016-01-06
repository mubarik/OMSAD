class Milestone < ActiveRecord::Base
 belongs_to :student
 belongs_to :faculty_member
 belongs_to :examination
 has_many :cosupervisors, :dependent => :destroy ,:before_add => :set_nest
 accepts_nested_attributes_for :cosupervisors,
    :reject_if=> lambda{|a| a[:cosupervisorname].blank? and a[:faculty_member_id].blank?},
    :allow_destroy => true
 has_many :examinations, :dependent => :destroy
 accepts_nested_attributes_for :examinations,
    :reject_if=> lambda{|a| a[:examinationdate].blank?},
    :allow_destroy => true
 has_many :phd_reports, :dependent => :destroy
 accepts_nested_attributes_for :phd_reports,
    :reject_if=> lambda{|a| a[:reportdate].blank?},
    :allow_destroy => true
 has_many :thesis_committees, :dependent => :destroy
 accepts_nested_attributes_for :thesis_committees,
    :reject_if=> lambda{|a| a[:cosupervisorname].blank? and a[:faculty_member_id].blank?},
    :allow_destroy => true
 has_many :proposal_committees, :dependent => :destroy
 accepts_nested_attributes_for :proposal_committees,
    :reject_if=> lambda{|a| a[:cosupervisorname].blank? and a[:faculty_member_id].blank?},
    :allow_destroy => true
 has_many :student_grants, :dependent => :destroy
 accepts_nested_attributes_for :student_grants,
    :reject_if=> lambda{|a| a[:totalamount].blank?},
    :allow_destroy => true
 belongs_to :research_grant
 

 validates :title, :format => { :with => /^[a-zA-Z\s\d]+$/}, :length=>{:maximum => 250}

  def set_nest(cosupervisor)
    cosupervisor.milestone ||= self
  end

 def semester_name
    "#{self.semester.offering}"" #{self.semester.year}"
  end


  def self.importphd(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
       @student = Student.find_by_rollno(row[0])
        @milestone = Milestone.find_by_student_id(@student)
       if @milestone.blank?
       c= Milestone.new
       c.student_id = @student.id
      c.title=row[1]
      c.supervisorcomments = row[2]
      @user = User.find_by_name(row[3])
      @faculty = FacultyMember.find_by_user_id(@user.id)
     c.faculty_member_id =  @faculty.id
      c.qualifierstatus = row[4]
      c.proposalsubmission = row[5]
      c.thesisdefence = row[6]
      c.granttype = row[7]
      c.grantname = row[8]
      @research = ResearchGrant.find_by_title(row[9])
      c.research_grant_id = @research.id
      c.grantstatus = row[10]

        if c.save
        #n=n+1
        GC.start if n%50==0
        end

      end
     end
      return n
     end

  def self.yearly_phd_supervision(faculty_id,year)
    @phd_supervision = Milestone.where("faculty_member_id=? AND
                                      ((extract(year from proposalsubmission) = ? OR extract(year from thesisdefence) = ?)
                                      OR (extract(year from proposalsubmission) <= ? AND extract(year from thesisdefence) >= ?))",
                                      faculty_id,year,year,year,year)
    return @phd_supervision
  end
  
  end