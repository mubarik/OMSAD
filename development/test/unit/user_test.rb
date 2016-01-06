require 'test_helper'

class UserTest < ActiveSupport::TestCase

 fixtures :users
 def setup
    @userCorrectEntry = users(:dataCorrectEntry)
#    @useralphabets = workshop_publications(:dataalphabets)
#    @userspecialcharacters = workshop_publications(:dataSpecialCharacters)
#    @userinvalidUrl = workshop_publications(:dataInvalidformatUrl)

  end

    test "should not save user without user name" do
    user = User.new( :name=>nil , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, "Saved the user without user name"
  end


    test "The name of user do not contain digits" do
   user = User.new( :name=>"45666633" , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Name of the user contain digits"
  end


   test "The length of the user name should not be greater then 30" do
    user = User.new( :name=>"mubarik ahmed shad aaaaaaaaaaaaaaaaaaaaaaaa", :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Length of the user name is greater then 30"
  end



    test "The name of the user do not contain special characters" do
    user = User.new( :name=>"mubarik @@@@@@@", :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Name of the user conatin special characters"
  end



    test "The email of the user should be in proper format" do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>"mubarik"  )
    assert !user.save, " Invalid email saved in data"
  end




    test "The email of the user should be in proper format test2" do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>"mubarik@"  )
    assert !user.save, " Invalid email saved in data"
  end




    test "The email of the user should be in proper format test3" do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>"mubarik@sssssss"  )
    assert !user.save, " Invalid email saved in data"
  end


    test "The email of the user should be in proper format test4" do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>"(#!(^~*(@sssssss.pk"  )
    assert !user.save, " Invalid email saved in data"
  end




    test " Should not save user without user id " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>nil,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid email saved in data"
  end


      test " Proper format of contact number " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>9888444555554,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid format for contact number"
  end



        test " Proper format of contact number test2 " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber=> "+988845554@@@",
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid format for contact number"
  end



    test " Proper format of contact number test3 " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>"+9888ggg55554",
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid format for contact number"
  end



  



    test " Proper format of contact number test5 " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>"+9888884445555545555555555555555555555555",
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid format for contact number, length is greater then standard"
  end



      test " Proper format of contact number test6 " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>@userCorrectEntry.gender ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>"+988",
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Invalid format for contact number , Length is less then standard"
  end



    test " User cannot be saved without gender " do
    user = User.new( :name=>@userCorrectEntry.name , :dateofbirth=> @userCorrectEntry.dateofbirth,
                                 :gender =>nil ,
                                 :department_id =>@userCorrectEntry.department_id,
                                 :address => @userCorrectEntry.address ,
                                 :contactnumber =>@userCorrectEntry.contactnumber,
                                 :email =>@userCorrectEntry.email  )
    assert !user.save, " Gender is required field. User should not saved without gender"
  end



  def test_associations
    assert_working_associations
  end






end
