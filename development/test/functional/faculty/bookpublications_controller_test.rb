require 'test_helper'

class Faculty::BookpublicationsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@book_publication_wrappers)
  end


  test  "should get show" do
    get :show, :id => book_publications(:data2).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:book_publication)


#    # assert that the variable  @user was assigned with the correct values
    assert_equal book_publications(:data2).publishername, assigns(:book_publication).publishername
    assert_equal publications(:dataCorrectEntrybook).abstract, assigns(:book_publication).publication.abstract
    assert_equal publications(:dataCorrectEntrybook).title, assigns(:book_publication).publication.title
    assert_equal book_publications(:data2).publication_id, assigns(:book_publication).publication_id
    assert_equal publications(:dataCorrectEntrybook).publicationyear, assigns(:book_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntrybook).publicationstatus, assigns(:book_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntrybook).keywords, assigns(:book_publication).publication.keywords
    assert_equal publications(:dataCorrectEntrybook).doi, assigns(:book_publication).publication.doi

   end


  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
  end

   test "should get edit" do
    get :edit, :id => book_publications(:data2).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should destroy" do
    delete :destroy, :id => book_publications(:data2).publication_id
    assert_redirected_to :controller => "bookpublications", :action => "index"
  end

end
