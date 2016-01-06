require 'test_helper'

class Faculty::ResearchgrantsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@research_grant_wrappers)
  end

   test  "should get show" do
    get :show, :id => research_grants(:dataCorrectEntry).id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:researchgrant)


#    # assert that the variable  @user was assigned with the correct values
    assert_equal research_grants(:dataCorrectEntry).title, assigns(:researchgrant).title
    assert_equal research_grants(:dataCorrectEntry).grantnumber, assigns(:researchgrant).grantnumber
    assert_equal research_grants(:dataCorrectEntry).fundingagency, assigns(:researchgrant).fundingagency
    assert_equal users(:usertest).name, assigns(:researchgrant).faculty_member.user.name

   end
  

  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@faculty_member)
    assert assigns(@user)
    assert assigns(@research_grant)
  end




 test "should get edit" do
    get :edit, :id => research_grants(:dataCorrectEntry).id
    assert_response :success
    assert_template "edit"
    assert assigns(@faculty_member)
    assert assigns(@research_grant)
    assert assigns(@user)
  end

 test "should destroy" do
    delete :destroy, :id => research_grants(:dataCorrectEntry).id
    assert_redirected_to :controller => "researchgrants", :action => "index"
  end



end