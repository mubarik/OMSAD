class FacultyMemberService < ActiveRecord::Base

  belongs_to :faculty_member

  def self.yearly_services(faculty_id,year)
    @services = FacultyMemberService.where(:faculty_member_id =>faculty_id, :year => year)
    return @services
  end
end
