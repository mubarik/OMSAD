class FacultyMemberStatusType < ActiveRecord::Base
  require 'globalconstants'
  def self.create_default_left_status
    left_status_id  = FacultyMemberStatusType.find_by_name('Left');
    if (left_status_id.blank?)
      FacultyMemberStatusType.create(:name=>GlobalConstants::Faculty_Status_Left_Name,
                                    :project_conf_id=>GlobalConstants::Project_Conf_Id);

    end
  end
end
