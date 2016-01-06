class ExternalUser < ActiveRecord::Base
   has_many :inventory_ownerships

   def self.create_externaluser(employee_id,designation,description)

     externaluser = ExternalUser.create(:employee_id => employee_id,
       :designation => designation,
     :description => description
     )
     return externaluser
     
  end
end
