require 'test_helper'

class Faculty::BookchapterpublicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@book_chapter_publication_wrappers)
  end

  test  "should get show" do
    get :show, :id => book_chapter_publications(:Correctdata).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:bookchapter_publication)
#    # assert that the variable  @user was assigned with the correct values
    assert_equal book_chapter_publications(:Correctdata).publishername, assigns(:bookchapter_publication).publishername
    assert_equal publications(:dataCorrectEntrybookchapter).abstract, assigns(:bookchapter_publication).publication.abstract
    assert_equal publications(:dataCorrectEntrybookchapter).title, assigns(:bookchapter_publication).publication.title
    assert_equal book_chapter_publications(:Correctdata).publication_id, assigns(:bookchapter_publication).publication_id
    assert_equal publications(:dataCorrectEntrybookchapter).publicationyear, assigns(:bookchapter_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntrybookchapter).publicationstatus, assigns(:bookchapter_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntrybookchapter).keywords, assigns(:bookchapter_publication).publication.keywords
    assert_equal publications(:dataCorrectEntrybookchapter).doi, assigns(:bookchapter_publication).publication.doi
   end

  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should get edit" do
    get :edit, :id => book_chapter_publications(:Correctdata).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should destroy" do
    delete :destroy, :id => book_chapter_publications(:Correctdata).publication_id
    assert_redirected_to :controller => "bookchapterpublications", :action => "index"
  end

end




