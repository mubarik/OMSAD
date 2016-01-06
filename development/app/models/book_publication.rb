class BookPublication < ActiveRecord::Base
     belongs_to :publication

  def self.all_wrappers
    book_publications = BookPublication.all
    book_publication_wrappers = Array.new
    book_publications.each do|book_publication|

       book_publication_wrapper = IndexWrapper.new( book_publication.publication.id,
                                                      'displayPic',
                                                      'book.jpeg',
                                                       book_publication.publication.title,
#                                                      'Author',book_publication.publication.faculty_member.user.name ,
                                                      'Publisher Name',book_publication.publishername,
                                                      'Publication Year',book_publication.publication.publicationyear,
                                                      'faculty/bookpublications')

      book_publication_wrappers.push(book_publication_wrapper )
    end

    return book_publication_wrappers.reverse
  end 
end
