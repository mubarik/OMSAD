class FacultyMemberResearchGrant < ActiveRecord::Base
  belongs_to :faculty_member
  belongs_to :research_grant

  alias_attribute :external_entity_name,:copiname

#  validates :external_entity_name ,:presence => {:message => "Name cannot be blank."} ,
#                        :length=>{:maximum => 30}, :format => { :with => /^[a-zA-Z ]+$/,:message=> "Only alphabets are allowed."}
#  validates :affiliationname ,:length=>{:maximum => 30}, :format => { :with => /^\s*[a-zA-Z,\s.]+\s*$/,:message=> "No special characters allowed."}
end
