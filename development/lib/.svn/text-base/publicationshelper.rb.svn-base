# To change this template, choose Tools | Templates
# and open the template in the editor.

module PublicationsHelper

  require 'dynamicdivconstants'
  include DynamicDivConstants

  def self.build_dummy_associations(child_publication)
      child_publication.build_publication
      child_publication.publication.build_faculty_member
  end

  def self.get_faculty_members
    faculty_members = FacultyMember.all
    return faculty_members
  end

  def self.get_users_all
    users_all = User.all
    return users_all
  end
  
  def self.insert_publication(params,publication_type)

    publication = Publication.create_publication(params[:txtitle],
                          
                                              params[:txabstract],
                                              params[:txpublicationyear],
                                              publication_type,
                                              params[:txpublicationstatus],
                                              params[:txkeywords],
                                              params[:txdoi])
   
    if (publication.save)
    
      ApplicationHelper::insert_multiple_users(params, publication.id, DynamicDivConstants::Publications)
    end
    
    return publication
  end

  def self.update_publication(params)

    publication = Publication.update_publication(params[:id],
                                              params[:txtitle],
                                              
                                              params[:txabstract],
                                              params[:txpublicationyear],
                                              params[:txpublicationstatus],
                                              params[:txkeywords],
                                              params[:txdoi])

    UserPublication.destroy_all(publication.id)

    ApplicationHelper::insert_multiple_users(params, publication.id, DynamicDivConstants::Publications)
    

    return publication
  end

end
