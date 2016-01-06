class FinancialAid < ActiveRecord::Base
  #belongs_to :student
  belongs_to :StudentSemester
  belongs_to :financial_aid_status_type
  has_many :financial_assets
  accepts_nested_attributes_for :financial_assets , :allow_destroy =>true
  validates :amount , :numericality => {:greater_than_or_equal_to => 0, :message => "Must be valid amount"} , :allow_nil => true
  

  def status
    if !financial_aid_status_type.blank? and !financial_aid_status_type.nil?
      return financial_aid_status_type.name
    end
    return "Not Provided"
  end
  def self.delete_financialaid(id)
    financialaid = FinancialAid.find_by_id(id)
    financialaid.destroy
  end

  def self.get_semesters(studentid)
    @summer_semesters = Semester.select(:id).where(:offering=>"Summer")
    @summer_semesters_array = Array.new
    @summer_semesters_array.push(0)
    @summer_semesters.each do |ss|
      @summer_semesters_array.push(ss.id)
    end
    @semesters_already_added = FinancialAid.select(:student_semester_id).where(:student_id=>studentid)
    @semesters_array = Array.new
    @semesters_array.push(0)
    @semesters_already_added.each do |s|
      @semesters_array.push(s.student_semester_id)
    end
    @semestersoffered = StudentSemester.find(:all, :conditions => ["id NOT IN (?) AND semester_id NOT IN (?) AND student_id = (?)", @semesters_array, @summer_semesters_array,studentid])
    return @semestersoffered
  end

  def self.get_semesters_for_edit(studentid,semesterid)
    @summer_semesters = Semester.select(:id).where(:offering=>"Summer")
    @summer_semesters_array = Array.new
    @summer_semesters_array.push(0)
    @summer_semesters.each do |ss|
      @summer_semesters_array.push(ss.id)
    end
    @semesters_already_added = FinancialAid.select(:student_semester_id).where(:student_id=>studentid)
    @semesters_array = Array.new
    @semesters_array.push(0)
    @semesters_already_added.each do |s|
      if s.student_semester_id != semesterid
        @semesters_array.push(s.student_semester_id)
      end
    end
    @semestersoffered = StudentSemester.find(:all, :conditions => ["id NOT IN (?) AND semester_id NOT IN (?) AND student_id = (?)", @semesters_array, @summer_semesters_array,studentid])
    return @semestersoffered
  end
end
