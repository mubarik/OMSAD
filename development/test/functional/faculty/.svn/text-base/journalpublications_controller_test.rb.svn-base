require 'test_helper'

class Faculty::JournalpublicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@journal_publication_wrappers)
  end

  test  "should get show" do
    get :show, :id => journal_publications(:dataCorrectEntry).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:journal_publication)


#    # assert that the variable  @user was assigned with the correct values
    assert_equal journal_publications(:dataCorrectEntry).journalname, assigns(:journal_publication).journalname
    assert_equal publications(:dataCorrectEntryJournal).abstract, assigns(:journal_publication).publication.abstract
    assert_equal publications(:dataCorrectEntryJournal).title, assigns(:journal_publication).publication.title
    assert_equal journal_publications(:dataCorrectEntry).publication_id, assigns(:journal_publication).publication_id
    assert_equal publications(:dataCorrectEntryJournal).publicationyear, assigns(:journal_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntryJournal).publicationstatus, assigns(:journal_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntryJournal).keywords, assigns(:journal_publication).publication.keywords
    assert_equal publications(:dataCorrectEntryJournal).doi, assigns(:journal_publication).publication.doi

   end


  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should get edit" do
    get :edit, :id => journal_publications(:dataCorrectEntry).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should destroy" do
    delete :destroy, :id => journal_publications(:dataCorrectEntry).publication_id
    assert_redirected_to :controller => "journalpublications", :action => "index"
  end

end
