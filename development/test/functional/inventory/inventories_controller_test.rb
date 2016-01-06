require 'test_helper'

class Inventory::InventoriesControllerTest < ActionController::TestCase


 test "should get index" do
    get :index
    assert_response :success
#    assert_not_nil assigns(:posts)
  end



  test  "should get show" do
    get :show, :id => inventories(:inventorytest).id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:inventory)
    # assert that the variable  @user was assigned with the correct values
    assert_equal inventories(:inventorytest).inventoryname, assigns(:inventory).inventoryname
    assert_equal inventories(:inventorytest).brand, assigns(:inventory).brand
  end

  
end