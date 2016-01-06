require 'test_helper'

class BookPublicationTest < ActiveSupport::TestCase
fixtures :book_publications


  def setup
    @book_publication1 = book_publications(:data1)
    @book_publication2 = book_publications(:data2)
  end

  test "publisher name should not have digits" do
    publication_book = BookPublication.new( :publishername=>@book_publication1.publishername )

    assert !publication_book.save, "publisher name should not have digits"
  end

  test "publisher name should not have special characters" do
    publication_book = BookPublication.new( :publishername=>@book_publication2.publishername  )

    assert !publication_book.save, "publisher name should not have special characters"
  end



  def test_associations
    assert_working_associations
  end


end
