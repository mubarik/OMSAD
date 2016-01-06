require 'test_helper'

class Faculty::WorkshoppublicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@workshop_publication_wrappers)
  end

  test  "should get show" do
    get :show, :id => workshop_publications(:dataCorrectEntry).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:workshop_publication)
#    # assert that the variable  @user was assigned with the correct values
    assert_equal workshop_publications(:dataCorrectEntry).workshopname, assigns(:workshop_publication).workshopname
    assert_equal publications(:dataCorrectEntryworkshop).abstract, assigns(:workshop_publication).publication.abstract
    assert_equal publications(:dataCorrectEntryworkshop).title, assigns(:workshop_publication).publication.title
    assert_equal workshop_publications(:dataCorrectEntry).publication_id, assigns(:workshop_publication).publication_id
    assert_equal publications(:dataCorrectEntryworkshop).publicationyear, assigns(:workshop_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntryworkshop).publicationstatus, assigns(:workshop_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntryworkshop).keywords, assigns(:workshop_publication).publication.keywords
    assert_equal publications(:dataCorrectEntryworkshop).doi, assigns(:workshop_publication).publication.doi
   end

  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should get edit" do
    get :edit, :id => workshop_publications(:dataCorrectEntry).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should destroy" do
    delete :destroy, :id => workshop_publications(:dataCorrectEntry).publication_id
    assert_redirected_to :controller => "workshoppublications", :action => "index"
  end

end
