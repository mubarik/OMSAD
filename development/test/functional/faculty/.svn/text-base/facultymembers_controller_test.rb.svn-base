require 'test_helper'

class Faculty::FacultymembersControllerTest < ActionController::TestCase
 test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@faculty_member_wrappers)
  end

 test  "should get show" do
    get :show, :id => faculty_members(:dataCorrectEntry).user_id
    # assert that the http response was 200
    assert_response :success 
    # assert that the correct template was rendered
    assert_template "show" 
    # assert that the variable  @user was assigned
    assert assigns(:facultymember)
    

#    # assert that the variable  @user was assigned with the correct values
    assert_equal faculty_members(:dataCorrectEntry).user_id, assigns(:facultymember).user_id
    assert_equal faculty_members(:dataCorrectEntry).designation, assigns(:facultymember).designation
    assert_equal faculty_members(:dataCorrectEntry).biography, assigns(:facultymember).biography
    assert_equal users(:usertest).address, assigns(:facultymember).user.address
    assert_equal users(:usertest).email, assigns(:facultymember).user.email
    assert_equal users(:usertest).contactnumber, assigns(:facultymember).user.contactnumber
   end


  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@faculty_member)
    assert assigns(@user)
  end


#   test  "should get create" do
#
#    post :create,  :facultymember => faculty_members(:dataCorrectEntry)
#    assert assigns(:facultymember).save?
#
#   end


  test "should get edit" do
    get :edit, :id => faculty_members(:dataCorrectEntry).user_id
    assert_response :success
    assert_template "edit"
    assert assigns(@faculty_member)
  end

 test "should destroy" do
    delete :destroy, :id => faculty_members(:dataCorrectEntry).user_id
    assert_redirected_to :controller => "facultymembers", :action => "index"
  end


end
