class Cosupervisor < ActiveRecord::Base
  belongs_to :ms_course
  belongs_to :faculty_member
  belongs_to :independent_study
  belongs_to :milestone

  validates :cosupervisorname , :length=>{:maximum => 50},
                                :format => { :with => /^[a-zA-Z ]+$/,:message=> "Name cannot have special characters.",:allow_blank=>true}        
  validates :email, :format => {:with => /^[\_]*([a-z0-9]+(\.|\_*)?)+@([a-z][a-z0-9\-]+(\.|\-*\.))+[a-z]{2,6}$/,
                    :message => "Email is invalid.", :allow_nil => true, :allow_blank=>true}

  validate :supervisor_cannot_be_a_cosupervisor
  validates :cosupervisorname, :presence => {:unless => "faculty_member_id", :message => "You must enter a co-supervisor or faculty member"}
  validates :faculty_member_id, :presence => {:unless => "cosupervisorname", :message => "You must enter a co-supervisor or faculty member"}
 # validate :cosupervisor_cannot_dublicate
  
  def supervisor_cannot_be_a_cosupervisor
    if !ms_course.blank?
      if ms_course.faculty_member_id == faculty_member_id
        errors.add(:faculty_member_id,'Already a supervisor.')
      end
    elsif !independent_study.blank?
      if independent_study.faculty_member_id == faculty_member_id
        errors.add(:faculty_member_id,'Already a supervisor.')
      end
    else
      if milestone.faculty_member_id == faculty_member_id
        errors.add(:faculty_member_id,'Already a supervisor.')
      end
    end
  end


  def cosupervisor_cannot_dublicate
    if !ms_course.blank?
      if !ms_course.cosupervisors.blank?
        ms_course.cosupervisors.each do |cosup|
          if cosup.faculty_member_id == faculty_member_id
            errors.add(:faculty_member_id,'Already a cosupervisor.')
          end
        end
      end
    elsif !independent_study.blank?
      if !independent_study.cosupervisors.blank?
        independent_study.cosupervisors.each do |cosup|
          if cosup.faculty_member_id == faculty_member_id
            errors.add(:faculty_member_id,'Already a cosupervisor.')
          end
        end
      end
    elsif !milestone.blank?
      milestone.cosupervisors.each do |cosup|
        if cosup.faculty_member_id == faculty_member_id
          errors.add(:faculty_member_id,'Already a cosupervisor.')
        end
      end
    end
  end

end
