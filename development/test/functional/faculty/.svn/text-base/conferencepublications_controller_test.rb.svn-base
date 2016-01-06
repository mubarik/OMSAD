require 'test_helper'

class Faculty::ConferencepublicationsControllerTest < ActionController::TestCase
 test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@conference_publication_wrappers)
  end

 test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
  end


 test  "should get show" do
    get :show, :id => conference_publications(:dataCorrectEntry).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:conference_publication)
    # assert that the variable  @user was assigned with the correct values
    assert_equal conference_publications(:dataCorrectEntry).conferencename, assigns(:conference_publication).conferencename
    assert_equal publications(:dataCorrectEntryConference).abstract, assigns(:conference_publication).publication.abstract
    assert_equal publications(:dataCorrectEntryConference).title, assigns(:conference_publication).publication.title
    assert_equal conference_publications(:dataCorrectEntry).publication_id, assigns(:conference_publication).publication_id
    assert_equal publications(:dataCorrectEntryConference).publicationyear, assigns(:conference_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntryConference).publicationstatus, assigns(:conference_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntryConference).keywords, assigns(:conference_publication).publication.keywords
    assert_equal publications(:dataCorrectEntryConference).doi, assigns(:conference_publication).publication.doi
   end

  test "should get edit" do
    get :edit, :id => conference_publications(:dataCorrectEntry).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

 test "should destroy" do
    delete :destroy, :id => conference_publications(:dataCorrectEntry).publication_id
    assert_redirected_to :controller => "conferencepublications", :action => "index"
  end

end
