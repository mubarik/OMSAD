require 'test_helper'

class PrinterTest < ActiveSupport::TestCase
   
  def setup
   
  end
  test "should not save printer technology if Special Characters" do
    printerObj = Printer.new( :technology => "%^&",
      #"^&^" or nil

      :speed=>"hj",
       #"^&^" or nil

      :memory=> "GB",
      #"^&^" or nil

      :mediatype=>"Inkjet"
      #nil

    )
    assert !printerObj.save, printerObj.errors.inspect
  end

 test "should not save printer speed if Special Characters" do
    printerObj = Printer.new( :technology => "LCV45",
      #"^&^" or nil

      :speed=>"^&*",
       #"^&^" or nil

      :memory=> "GB",
      #"^&^" or nil

      :mediatype=>"Inkjet"
      #nil

    )
    assert !printerObj.save, printerObj.errors.inspect
  end

  test "should not save printer memory if Special Characters" do
    printerObj = Printer.new( :technology => "LCV45",
      #"^&^" or nil

      :speed=>"34GB",
       #"^&^" or nil

      :memory=> "^&*(&*9",
      #"^&^" or nil

      :mediatype=>"Inkjet"
      #nil

    )
    assert !printerObj.save, printerObj.errors.inspect
  end

  test "should not save printer media type if Special Characters" do
    printerObj = Printer.new( :technology => "LCV45",
      #"^&^" or nil

      :speed=>"34GB",
       #"^&^" or nil

      :memory=> "32GB",
      #"^&^" or nil

      :mediatype=>"*()809"
      #nil

    )
    assert !printerObj.save, printerObj.errors.inspect
  end


  def test_associations
    assert_working_associations
  end
end
