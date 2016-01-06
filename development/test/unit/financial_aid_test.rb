require 'test_helper'

class FinancialAidTest < ActiveSupport::TestCase
  fixtures :financial_aids
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @financialaid = financial_aids(:data1)
  end

  test "should not save financial aid info if amount is not numeric type" do
    financialaid = FinancialAid.new(:student_id => @financialaid.student_id,:amount => "one lac",:startdate => @financialaid.startdate,:enddate => @financialaid.enddate)
    assert !financialaid.save, "Saved the financial aid info but amount is not numeric type"
  end

  def test_associations
    assert_working_associations
  end
  # called after every single test
  def teardown
    # as we are re-initializing @financialaid before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @financialaid = nil
  end
end
