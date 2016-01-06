class ConferencePublication < ActiveRecord::Base
  belongs_to :publication
  #Conference paper rank
  belongs_to :conference_rank,
             :foreign_key=>'rank_id',
             :class_name=>'Rank'
 validates :conferencename , :presence => { :message => "Conference name is required." } ,
           :length=>{:maximum => 250}
#           :format => { :with => /^[a-zA-Z\d\s]*$/}

  validates :website ,:presence => {:message => "URL is incorrect."},
            :format => {:with => %r{( https?:// | www\. )[^\s<]+}x}
  
  validates :referenceweb ,:allow_blank => true,           
            :format => {:with => %r{( https?:// | www\. )[^\s<]+}x}

  validates :reference ,:allow_blank => true,            
            :length=>{:maximum => 250},
            :format => { :with => /^[a-zA-Z\d\s]*$/}
            
  validates :acceptancerate,  :allow_blank => true,
            :numericality => { :greater_than => 0, :less_than_or_equal_to => 100}


#  validate :start_must_be_before_end_date

  def start_must_be_before_end_date
   return unless conferencestartdate and conferenceenddate
    errors.add(:conferencestartdate, "Start date must be before end date") unless conferencestartdate <= conferenceenddate
  end

  def rank
    if !conference_rank.blank?
      return conference_rank.name
    end
    return "Not provided"
  end

def self.all_wrappers
    conference_publications = ConferencePublication.all
    conference_publication_wrappers = Array.new
    conference_publications.each do|conference_publication|

       conference_publication_wrapper = IndexWrapper.new( conference_publication.publication.id,
                                                      'displayPic',
                                                      'penguin.jpg',
                                                       conference_publication.publication.title,
                                                      #'Author',conference_publication.publication.faculty_member.user.name ,
                                                      'Conference Name',conference_publication.conferencename,
                                                      'Publication Year',conference_publication.publication.publicationyear,
                                                      'Website',conference_publication.website,
                                                      'faculty/conferencepublications')

      conference_publication_wrappers.push(conference_publication_wrapper)
    end

    return conference_publication_wrappers.reverse
  end
end
