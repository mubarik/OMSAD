require 'test_helper'

class TechnicalReportPublicationTest < ActiveSupport::TestCase



fixtures :technical_report_publications
 def setup
    @TRPublicationCorrectEntry = technical_report_publications(:dataCorrectEntry)
    @TRPublicationalphabets = technical_report_publications(:dataalphabetsOnly)
    @TRPublicationspecialcharacters = technical_report_publications(:dataSpecialCharacterOnly)
  end



    test "Technical report publication should  not saved without department id" do
    technicalreport_publication = TechnicalReportPublication.new( :publication_id=>nil ,
                                          :technicalreportnumber=> @TRPublicationCorrectEntry.technicalreportnumber
                       
                                                               )

    assert !technicalreport_publication.save, "Technical Repot publication should not saved without department id"
  end





    test "Technical report publication should  not saved without technical report number" do
    technicalreport_publication = TechnicalReportPublication.new( :publication_id=>@TRPublicationCorrectEntry.publication_id ,
                                          :technicalreportnumber=>nil       )

    assert !technicalreport_publication.save, "Technical Repot publication should not saved without technical report number"
  end




      test "Technical report publication should  not saved with invalid entry in technical report number" do
    technicalreport_publication = TechnicalReportPublication.new( :publication_id=>"2" ,
                                          :technicalreportnumber=>@TRPublicationspecialcharacters.technicalreportnumber      )

    assert !technicalreport_publication.save, "Technical Repot publication should not saved with invalid entry in technical report number"
  end



  def test_associations
    assert_working_associations
  end




end
