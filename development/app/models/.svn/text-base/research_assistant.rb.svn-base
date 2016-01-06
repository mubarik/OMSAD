class ResearchAssistant < ActiveRecord::Base
# has one-to-one relationship with user table
  belongs_to :user
  belongs_to :faculty_member
  belongs_to :research_grant

  validates :employee_id, :presence =>{ :message => 'RA ID required'},
                          :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                          :uniqueness => {:message => "RA ID already exist"}
  validates_format_of :employee_id, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  has_attached_file :document
  validates_attachment_size :document,
                            :less_than => 10.megabytes,
                            :message => "File size should be less than 10 megabytes."
  validates_attachment_content_type :document,
                                    :content_type => ['application/msword','application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
                                    :message => "Invalid document type."

   def self.all_wrappers
      rassistants = ResearchAssistant.all
      rassistant_list_wrappers = Array.new
      imgclass = 'profilePicture'
      rassistants.each do|rassistant|
        if rassistant.user.photo_file_name.nil?
          if rassistant.user.gender == "Male"
            photo = 'user.png'
          else
            photo = 'female_user.png'
          end
        else
          photo = rassistant.user.photo
        end
      rassistant_list_wrapper = IndexWrapper.new( rassistant.user.id,
                                                  imgclass,
                                                  photo,
                                                  rassistant.user.name,
                                                 'Home Address:', rassistant.user.address,
                                                 'Email:', rassistant.user.email,
                                                 'Contact Number:', rassistant.user.contactnumber,
                                                 'inventory/researchassistants')

        rassistant_list_wrappers.push(rassistant_list_wrapper)
      end
      return rassistant_list_wrappers.reverse
    end

# Add research Assistant
   def self.add_research_assistant(uid,
                               employeeid,
                               description)
     ResearchAssistant.create(:user_id =>uid,
                         :employee_id => employeeid,
                         :description => description)                      

  end

   def self.update_rassistant(id,employeeid,description)
      ra = ResearchAssistant.find_by_id(id)
      ra.update_attributes( :employee_id => employeeid, :description =>description)
   end
      
   
end
