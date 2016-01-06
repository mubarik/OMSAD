class JournalPublication < ActiveRecord::Base
  belongs_to :publication

  validates :journalname , :presence => { :message => "Journal name cannot be blank"},
           :length=>{:maximum => 250}
#           :format => { :with => /^[a-zA-Z\d\s]*$/}

#  validates :volume , # :presence => { :message => "Volume cannot be blank"},
#            :numericality => true,
#            :format => { :with => /^([1-9][0-9]{0,2}|1000)$/}

#  validates :issuenumber ,
#            :presence => { :message => "issue number cannot be blank"},
#            :numericality => true,
#            :format => { :with => /^[0]*[1-9]$|^[0]*1[0-2]$/}
            
  validates :impactfactor ,
            :allow_blank => true,
            :numericality => true,
            :format => {:with => /^(?!0\d|$)\d*(\.\d{1,2})?$/}
  
  def self.all_wrappers
    journal_publications = JournalPublication.all
    journal_publication_wrappers = Array.new
    journal_publications.each do|journal_publication|

       journal_publication_wrapper = IndexWrapper.new( journal_publication.publication.id,
                                                     'displayPic',
                                                     'penguin.jpg',
                                                     journal_publication.publication.title,
#                                                     'Author',journal_publication.publication.faculty_member.user.name ,
                                                     'Journal Name',journal_publication.journalname,
                                                     'Publication Year',journal_publication.publication.publicationyear,
                                                     'Volume',journal_publication.volume,
                                                     'faculty/journalpublications')

      journal_publication_wrappers.push(journal_publication_wrapper)
    end

    return journal_publication_wrappers.reverse
  end  
end
