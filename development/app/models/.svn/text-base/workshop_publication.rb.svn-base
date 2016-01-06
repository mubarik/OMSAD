class WorkshopPublication < ActiveRecord::Base
  belongs_to :publication
  
 validates :workshopname , :presence => { :message => "Workshop name is required." } ,
           :length=>{:maximum => 250},
           :format => { :with => /^[a-zA-Z\d\s]*$/}
 validates :conferencename , :allow_blank => true,
           :length=>{:maximum => 250},
           :format => { :with => /^[a-zA-Z\d\s]*$/}
 validates :website ,:allow_blank => true,
            :format => {:with => %r{( (https?://)? | www\. )[^\s<]+}x}
 validates :conferencewebsite ,:allow_blank => true,
            :format => {:with => %r{( (https?://)? | www\. )[^\s<]+}x}

 validates :city , :allow_blank => true,
           :length=>{:maximum => 50},
           :format => { :with => /^[a-zA-Z ]+$/}
# validate :start_must_be_before_end_date

  def start_must_be_before_end_date
    return unless workshopstartdate and workshopenddate
    errors.add(:workshopstartdate, "Start date must be before end date") unless workshopstartdate <= workshopenddate
  end

  def self.all_wrappers
    workshop_publications = WorkshopPublication.all
    workshop_publication_wrappers = Array.new
    workshop_publications.each do|workshop_publication|

       workshop_publication_wrapper = IndexWrapper.new( workshop_publication.publication.id,
                                                      'displayPicGrant',
                                                      'penguin.jpg',
                                                       workshop_publication.publication.title,
#                                                      'Author',workshop_publication.publication.faculty_member.user.name ,
                                                      'Workshop Name',workshop_publication.workshopname,
                                                      'Publication Year',workshop_publication.publication.publicationyear,
                                                      'Website',workshop_publication.website,
                                                      'faculty/workshoppublications')

      workshop_publication_wrappers.push(workshop_publication_wrapper)
    end

    return workshop_publication_wrappers.reverse
  end
end
