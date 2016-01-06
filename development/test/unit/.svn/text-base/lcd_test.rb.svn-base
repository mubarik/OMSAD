require 'test_helper'

class LcdTest < ActiveSupport::TestCase

  fixtures :lcds
  def setup
    @lcd = lcds(:lcdtest)
  end

  test "should not save LCD details if Type does not have alphabets only" do
    lcdObj = Lcd.new(

     :lcdtype => "FG13",
      #"^&^" 

      :resolution=> "32 x 32 pixels",
       #"^&^"

      :size=> "2"
      #"^&^" 


    )
    assert !lcdObj.save, lcdObj.errors.inspect
  end

  test "should not save LCD details if Resolution has special characters" do
    lcdObj = Lcd.new(

     :lcdtype => 4,
      #"^&^"

      :resolution=> "32 x 32 pixels &*^*&",
       #"^&^"

      :size=> "2"
      #"^&^"


    )
    assert !lcdObj.save, lcdObj.errors.inspect
  end


  test "should not save LCD details if size has special characters" do
    lcdObj = Lcd.new(

     :lcdtype => 4,
      #"^&^"

      :resolution=> "32 x 32 pixels",
       #"^&^"

      :size=> "2&*("
      #"^&^"


    )
    assert !lcdObj.save, lcdObj.errors.inspect
  end

  def test_associations
    assert_working_associations
  end
  
end
