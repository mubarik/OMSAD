require 'test_helper'

class ScannerTest < ActiveSupport::TestCase
 fixtures :scanners
 def setup
    @scanObj = scanners(:scannertest)
  end
   test "should not save scanner details if scanner type has other than alphabets" do
    scanObj = Scanner.new(

     :scannertype => "21xvv*()",
     :resolution=> "3",
     :scansize=> "2",
     :fileformate=> "23GB"
     
    )
    assert !scanObj.save, scanObj.errors.inspect
  end

 test "should not save scanner details if scanner resolution has special characters" do
    scanObj = Scanner.new(

     :scannertype => "Flatbed",
     :resolution=> "%&^*^&*",
     :scansize=> "2",
     :fileformate=> "23GB"

    )
    assert !scanObj.save, scanObj.errors.inspect
  end

  test "should not save scanner details if scan size has special characters" do
    scanObj = Scanner.new(

     :scannertype => "Flatbed",
     :resolution=> "32 x 33 pixels",
     :scansize=> "**(8",
     :fileformate=> "23GB"
     

    )
    assert !scanObj.save, scanObj.errors.inspect
  end

 test "should not save scanner details if scanner file format has special characters" do
    scanObj = Scanner.new(

     :scannertype => "Flatbed",
     :resolution=> "32 x 86 pixels",
     :scansize=> "2",
     :fileformate=> "^&*8"
     
    )
    assert !scanObj.save, scanObj.errors.inspect
  end

 def test_associations
    assert_working_associations
  end
  
end
