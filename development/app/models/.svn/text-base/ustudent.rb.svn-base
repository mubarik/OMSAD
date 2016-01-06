class Ustudent < ActiveRecord::Base
  belongs_to :user

  validates :employee_id, :presence =>{ :message => 'Student ID required'},
                                        :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                                        :uniqueness => {:message => "Student ID already exist"}
  validates_format_of :employee_id, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

      def self.all_wrappers
      ustudents = Ustudent.all
      ustudent_list_wrappers = Array.new
      imgclass = 'profilePicture'
      ustudents.each do|ustudent|
        if ustudent.user.photo_file_name.nil?
          if ustudent.user.gender == "Male"
            photo = 'user.png'
          else
            photo = 'female_user.png'
          end
        else
          photo = ustudent.user.photo
        end
      ustudent_list_wrapper = IndexWrapper.new( ustudent.user.id,
                                                  imgclass,
                                                  photo,
                                                  ustudent.user.name,
                                                 'Home Address:', ustudent.user.address,
                                                 'Email:', ustudent.user.email,
                                                 'Contact Number:', ustudent.user.contactnumber,
                                                 'inventory/ustudents')

        ustudent_list_wrappers.push(ustudent_list_wrapper)
      end
      return ustudent_list_wrappers.reverse
    end

end
