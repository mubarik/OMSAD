require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    fixtures :inventories
  def setup
    @inventory = inventories(:inventorytest)
  end
  test "should not save inventory name if nil" do
    invObj = Inventory.new( :inventoryname => "EXTENSA",
      #"^&^" or nil
      
      :brand=>"HP",
       #"^&^" or nil
      
      :model=> "model",
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end

 test "should not save inventory name if special characters" do
    invObj = Inventory.new( :inventoryname => "Extensa",
      #"^&^" or nil

      :brand=>"HP",
       #"^&^" or nil

      :model=> "model",
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end
  
  test "should not save inventory brand if nil" do
    invObj = Inventory.new( :inventoryname => "HP Printer",
      #"^&^" or nil

      :brand=> nil,
       #"^&^" or nil

      :model=> "model",
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end

   test "should not save inventory brand if special characters" do
    invObj = Inventory.new( :inventoryname => "HP Printer",
      #"^&^" or nil

      :brand=> "%^&&^",
       #"^&^" or nil

      :model=> "model",
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end

  test "should not save inventory model if special characters" do
    invObj = Inventory.new( :inventoryname => "HP Printer",
      #"^&^" or nil

      :brand=> "HP",
       #"^&^" or nil

      :model=> "^&*",
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end

  test "should not save inventory model if nil" do
    invObj = Inventory.new( :inventoryname => "HP Printer",
      #"^&^" or nil

      :brand=> "HP",
       #"^&^" or nil

      :model=> nil,
      #"^&^" or nil

      :inventory_type_id=>23
      #nil

    )
    assert !invObj.save, invObj.errors.inspect
  end

  def test_associations
    assert_working_associations
  end
end
