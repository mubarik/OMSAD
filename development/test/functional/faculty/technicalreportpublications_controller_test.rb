require 'test_helper'

class Faculty::TechnicalreportpublicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template "index"
    assert assigns(@technicalreport_publication_wrappers)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template "new"
    assert assigns(@authors)
    assert assigns(@publication)
    assert assigns(@departments)
  end

  test  "should get show" do
    get :show, :id => technical_report_publications(:dataCorrectEntry).publication_id
    # assert that the http response was 200
    assert_response :success
    # assert that the correct template was rendered
    assert_template "show"
    # assert that the variable  @user was assigned
    assert assigns(:technical_report_publication)
    # assert that the variable  @user was assigned with the correct values
    assert_equal technical_report_publications(:dataCorrectEntry).technicalreportnumber, assigns(:technical_report_publication).technicalreportnumber
    assert_equal publications(:dataCorrectEntryTechnical).abstract, assigns(:technical_report_publication).publication.abstract
    assert_equal publications(:dataCorrectEntryTechnical).title, assigns(:technical_report_publication).publication.title
    assert_equal technical_report_publications(:dataCorrectEntry).publication_id, assigns(:technical_report_publication).publication_id
    assert_equal publications(:dataCorrectEntryTechnical).publicationyear, assigns(:technical_report_publication).publication.publicationyear
    assert_equal publications(:dataCorrectEntryTechnical).publicationstatus, assigns(:technical_report_publication).publication.publicationstatus
    assert_equal publications(:dataCorrectEntryTechnical).keywords, assigns(:technical_report_publication).publication.keywords
    assert_equal publications(:dataCorrectEntryTechnical).doi, assigns(:technical_report_publication).publication.doi
   end

  test "should get edit" do
    get :edit, :id => technical_report_publications(:dataCorrectEntry).publication_id
    assert_response :success
    assert_template "edit"
    assert assigns(@authors)
    assert assigns(@publication)
  end

  test "should destroy" do
    delete :destroy, :id => technical_report_publications(:dataCorrectEntry).publication_id
    assert_redirected_to :controller => "technicalreportpublications", :action => "index"
  end


end



