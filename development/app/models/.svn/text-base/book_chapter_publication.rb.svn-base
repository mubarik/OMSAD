class BookChapterPublication < ActiveRecord::Base
  belongs_to :publication

  validates :bookname ,  # :presence => { :message => "Book name is required." } ,
           :length=>{:maximum => 250}
#           :format => { :with => /^[a-zA-Z\d\s]*$/}
  validates :publishername,
            :allow_blank => true,
            :length=>{:maximum => 50}
#            :format => { :with => /^[a-zA-Z ]+$/}
  validates :editors , 
            :allow_blank => true,
            :length=>{:maximum => 50},
            :format => { :with => /^[a-zA-Z ]+(,[a-zA-Z ]+)*+$/}

 def self.all_wrappers
    book_chapter_publications = BookChapterPublication.all
    book_publication_wrappers = Array.new
    book_chapter_publications.each do|book_chapter_publication|

       book_publication_wrapper = IndexWrapper.new( book_chapter_publication.publication.id,
                                                      'displayPic',
                                                      'book.jpeg',
                                                       book_chapter_publication.publication.title,
#                                                      'Author',book_chapter_publication.publication.faculty_member.user.name ,
                                                    
                                                      'Publication Year',book_chapter_publication.publication.publicationyear,
                                                      'faculty/bookchapterpublications')

      book_publication_wrappers.push(book_publication_wrapper )
    end
    return book_publication_wrappers.reverse
 end 
end
