class Astaff < ActiveRecord::Base
  belongs_to :user

  validates :employee_id, :presence =>{ :message => 'Staff ID required'},
                                        :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."},
                                        :uniqueness => {:message => "Staff ID already exist"}
  validates_format_of :employee_id, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  def self.all_wrappers
      astaffs = Astaff.all
      astaff_list_wrappers = Array.new
      imgclass = 'profilePicture'
      astaffs.each do|astaff|
        if astaff.user.photo_file_name.nil?
          if astaff.user.gender == "Male"
            photo = 'user.png'
          else
            photo = 'female_user.png'
          end
        else
          photo = astaff.user.photo
        end

      astaff_list_wrapper = IndexWrapper.new( astaff.user.id,
                                                  imgclass,
                                                  photo,
                                                  astaff.user.name,
                                                 'Home Address:', astaff.user.address,
                                                 'Email:', astaff.user.email,
                                                 'Contact Number:', astaff.user.contactnumber,
                                                 'inventory/astaffs')

        astaff_list_wrappers.push(astaff_list_wrapper)
      end
      return astaff_list_wrappers.reverse
    end

end
