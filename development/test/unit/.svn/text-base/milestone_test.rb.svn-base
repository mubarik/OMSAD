require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  fixtures :milestones
  # test "the truth" do
  #   assert true
  # end
  # called before every single test
  def setup
    @milestone= milestones(:data1)
  end

  test "should not save milestons if title contain special characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => "*/omsad*-",:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but title contains special charaters"
  end

  test "should not save milestons if cosupervisor name contains special characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => "*/@Asim Karim#!!",:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => "*/omsad*-",:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but cosupervisor name contains special charaters"
  end

  test "should not save milestons if panelone name contain special characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => "*/omsad*-",:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => "/*panelone/*/&^" ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but panelone name contains special charaters"
  end

  test "should not save milestons if paneltwo name contain special characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => "*/omsad*-",:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => "/*paneltwo/*/&^",:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but paneltwo contains special charaters"
  end

  test "should not save milestons if panelthree name contain special characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => "*/omsad*-",:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> "/*panelthree/*/&^")
    assert !milestone.save, "Saved the milestoness but panelthree name contains special charaters"
  end

  test "should not save milestons if title is greater than 250 characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => milestones(:data2).title,:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but title is greater than 250 characters"
  end

  test "should not save milestons if cosupervisor name is greater than 50 characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => milestones(:data2).cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => @milestone.title,:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but cosupervisor name is greater than 50 characters"
  end

  test "should not save milestons if panelone name is greater than 50 characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => @milestone.title,:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => milestones(:data2).panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but panelone name is greater than 50 characters"
  end

  test "should not save milestons if paneltwo name is greater than 50 characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => @milestone.title,:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => milestones(:data2).paneltwo,:panelthree=> @milestone.panelthree)
    assert !milestone.save, "Saved the milestoness but paneltwo name is greater than 50 characters"
  end

  test "should not save milestons if panelthree name is greater than 50 characters" do
    milestone = Milestone.new(:student_id => @milestone.student_id, :cosupervisor => @milestone.cosupervisor,:proposalsubmission => @milestone.proposalsubmission,
    :firstqualifier => @milestone.firstqualifier, :secondqualifier => @milestone.secondqualifier, :thesisdefence => @milestone.thesisdefence,:title => @milestone.title,:faculty_member_id => @milestone.faculty_member_id, :qualifierstatus => @milestone.qualifierstatus, :gre => @milestone.gre,
    :panelone => @milestone.panelone ,:paneltwo => @milestone.paneltwo,:panelthree=> milestones(:data2).panelthree)
    assert !milestone.save, "Saved the milestoness but panelthree name is greater than 50 characters"
  end

  def test_associations
    assert_working_associations
  end
  # called after every single test
  def teardown
    # as we are re-initializing @milestone before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @milestone = nil
  end
end
