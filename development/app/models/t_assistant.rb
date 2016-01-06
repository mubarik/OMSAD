class TAssistant < ActiveRecord::Base
  # has one-to-one relationship with user table
  belongs_to :user

  validates :employee_id, :presence =>{ :message => 'TA ID required'},
                          :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                          :uniqueness => {:message => "TA ID already exist"}
  validates_format_of :employee_id, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :evalgpa, :numericality =>{:greater_than => -0.0000001, :less_than => 4.0001, :message => "Must be between 0 and 4.0"} , :allow_nil => true,  :length => {:maximum => 4, :message => "GPA must have 2 decimal digits"}

  has_attached_file :document
  validates_attachment_size :document,
                            :less_than => 10.megabytes,
                            :message => "File size should be less than 10 megabytes."
  validates_attachment_content_type :document,
                                    :content_type => ['application/msword','application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
                                    :message => "Invalid document type."

def username
  user.name
end

      def self.all_wrappers
      tassistants = TAssistant.all
      tassistant_list_wrappers = Array.new
      imgclass = 'profilePicture'
      tassistants.each do|tassistant|
        if tassistant.user.photo_file_name.nil?
          if tassistant.user.gender == "Male"
            photo = 'user.png'
          else
            photo = 'female_user.png'
          end
        else
          photo = tassistant.user.photo
        end
      tassistant_list_wrapper = IndexWrapper.new( tassistant.user.id,
                                                  imgclass,
                                                  photo,
                                                  tassistant.user.name,
                                                 'Home Address:', tassistant.user.address,
                                                 'Email:', tassistant.user.email,
                                                 'Contact Number:', tassistant.user.contactnumber,
                                                 'inventory/tassistants')

        tassistant_list_wrappers.push(tassistant_list_wrapper)
      end
      return tassistant_list_wrappers.reverse
    end
    
    def self.add_teacher_assistant(uid,
                               employeeid,
                               description)
     TAssistant.create(:user_id =>uid,
                       :employee_id => employeeid,
                       :description => description)
    end

    def self.update_assistant(id,employeeid, description)
      assistant = TAssistant.find_by_id(id)
      assistant.update_attributes( :employee_id => employeeid, :description =>description)
    end


end
