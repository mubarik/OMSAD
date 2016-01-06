class StudentSemester < ActiveRecord::Base
  belongs_to :student
  belongs_to :semester 
  has_many :assets
  has_one :financial_aid, :dependent => :destroy
  accepts_nested_attributes_for :assets , :allow_destroy =>true

  validates :student_id, :uniqueness => {:scope => [:semester_id], :message => 'Student already enrolled in this semster'}
  #validates :semestergpa, :numericality =>{:greater_than => -0.001, :less_than => 4.0001, :message => "Must be between 0 and 4.0"} , :length => {:maximum => 4, :message => "GPA must have 2 decimal digits"}, :allow_nil => true
  #validates_attachment_content_type :semesterexception, :content_type => ['image/jpeg', 'image/png']

  def semester_name
    "#{self.semester.offering}"" #{self.semester.year}"
  end

  def semester_financial_name
    "#{self.semester.offering}"" #{self.semester.year}"
  end

  def semester_financial_id
     self.id
  end
end