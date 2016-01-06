class MsCourse < ActiveRecord::Base
  belongs_to :student_semester_part1,
             :foreign_key=>"student_semester1_id",
             :class_name =>"StudentSemester"
  belongs_to :student_semester_part2,
             :foreign_key=>"student_semester2_id",
             :class_name =>"StudentSemester"
  has_many :cosupervisors, :dependent => :destroy,:before_add => :set_nest
  belongs_to :faculty_member
  belongs_to :student
  accepts_nested_attributes_for :cosupervisors,
    :reject_if=> lambda{|a| a[:cosupervisorname].blank? and a[:faculty_member_id].blank?},
    :allow_destroy => true
  validates :title, :presence => { :message => "title is required" },
                    :format => { :with => /^[a-zA-Z\s\d]+$/}, :length=>{:maximum => 250}
  validate :cannot_add_same_semester
  validate :thesis_must_be_after_proposal_date

  def set_nest(cosupervisor)
    cosupervisor.ms_course ||= self
  end


  def cannot_add_same_semester
    errors.add(:student_semester2_id,'You cannot add same semester for thesis part 1 and 2.') if self.student_semester1_id == self.student_semester2_id
  end

  def thesis_must_be_after_proposal_date
    return unless self.proposaldefencedate and self.thesisdefencedate
    errors.add(:thesisdefencedate, "Thesis defence date must be after proposal defence date.") unless self.proposaldefencedate <= self.thesisdefencedate
 end

  def semester_name
    "#{self.semester.offering}"" #{self.semester.year}"
  end

  def self.importthesis(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
        @student = Student.find_by_rollno(row[0])
        @mscourse = MsCourse.find_by_student_id(@student)
         if @mscourse.blank?
           c=MsCourse.new
           @students = Student.find_by_rollno(row[0])
           c.student_id = @students.id
           c.title=row[1]
           @user = User.find_by_name(row[2])
           @faculty = FacultyMember.find_by_user_id(@user.id)
           c.faculty_member_id =  @faculty.id
           c.coursetype = row[3]
           @semester1 = Semester.find_by_offering_and_year(row[4], row[5])
           @studentsemester = StudentSemester.find_by_semester_id(@semester1.id)
           c.student_semester1_id = @studentsemester.id
           c.proposaldefencedate = row[6]
           if row[3] == 'Thesis'
             @semester2 = Semester.find_by_offering_and_year(row[7], row[8])
             @studentsemester = StudentSemester.find_by_semester_id(@semester2.id)
             c.student_semester2_id = @studentsemester.id
             c.thesisdefencedate = row[9]
           end

              if c.save
              #n=n+1
              GC.start if n%50==0
              end

        end
     end
      return n
   end

  def self.yearly_thesis_supervision(faculty_id,year)
    MsCourse.joins([:student_semester_part1=>[:semester]]).where("faculty_member_id = "+ faculty_id + " and coursetype = 'Thesis' and " +"semesters.year like '%%" + year + "%%'")+
    MsCourse.joins([:student_semester_part2=>[:semester]]).where("faculty_member_id = "+ faculty_id + " and coursetype = 'Thesis' and " +"semesters.year like '%%" + year + "%%'")

  end
    def self.yearly_project_supervision(faculty_id,year)
    MsCourse.joins([:student_semester_part1=>[:semester]]).where("faculty_member_id = "+ faculty_id + " and coursetype = 'Project' and " +"semesters.year like '%%" + year + "%%'")
    
  end
end