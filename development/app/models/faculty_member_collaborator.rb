class FacultyMemberCollaborator < ActiveRecord::Base
  belongs_to :faculty_member

def self.faculty_collaboration (faculty_id,year)
   @collaborations = FacultyMemberCollaborator.where("faculty_member_id = ? AND
                                                  ((extract(year from startdate) = ? OR extract(year from enddate) = ?)
                                                  OR (extract(year from startdate) <= ? AND extract(year from enddate) >= ?))",
                                                  faculty_id, year,year,year,year)
    return @collaborations
end
end