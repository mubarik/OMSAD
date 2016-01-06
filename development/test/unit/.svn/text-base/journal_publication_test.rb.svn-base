require 'test_helper'

class JournalPublicationTest < ActiveSupport::TestCase


 fixtures :journal_publications

  def setup
    @journalPublicationCorrectEntry = journal_publications(:dataCorrectEntry)
    @journalPublicationAlphabets = journal_publications(:dataalphabetsOnly)
    @journalPublicationSpecialCharacters = journal_publications(:dataSpecialcharsOnly)
    end

    test "Jornal publication should not saved with invalid entry in journal name" do
    publication_journal = JournalPublication.new( :publication_id=>@journalPublicationCorrectEntry.publication_id ,
                                          :journalname=>@journalPublicationSpecialCharacters.journalname,
                                          :volume => @journalPublicationCorrectEntry.volume,
                                          :impactfactor=>@journalPublicationCorrectEntry.impactfactor
                                                                           )

    assert !publication_journal.save, "Jornal publication should not saved with invalid entry in journal name"
  end



  test "Jornal publication should not saved with invalid entry in Volume" do
    publication_journal = JournalPublication.new( :publication_id=>@journalPublicationCorrectEntry.publication_id ,
                                          :journalname=>@journalPublicationCorrectEntry.journalname,
                                          :volume => @journalPublicationAlphabets.volume,
                                          :impactfactor=>@journalPublicationCorrectEntry.impactfactor
                                                               )

    assert !publication_journal.save, "Jornal publication should not saved with invalid entry in Volume"
  end



  test "Jornal publication should not saved with invalid entry in Volume test 1" do
    publication_journal = JournalPublication.new( :publication_id=>@journalPublicationCorrectEntry.publication_id ,
                                          :journalname=>@journalPublicationCorrectEntry.journalname,
                                          :volume => @journalPublicationSpecialCharacters.volume,
                                          :impactfactor=>@journalPublicationCorrectEntry.impactfactor
                                                               )

    assert !publication_journal.save, "Jornal publication should not saved with invalid entry in Volume test 1"
  end



  def test_associations
    assert_working_associations
  end




end
