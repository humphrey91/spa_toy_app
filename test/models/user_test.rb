require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Test", last_name: "User",
                     email: "test@example.com", password: "123456", 
                     password_confirmation: "123456")
  end

  test "should be valid" do
    assert @user.valid?
  end 

  test "first name should be present" do 
    @user.first_name = "  "
    assert_not @user.valid? 
  end 

  test "last name should be present" do 
    @user.last_name = "  "
    assert_not @user.valid? 
  end 

  test "first name should not be too long" do 
    @user.first_name = "a" * 21
    assert_not @user.valid? 
  end 

  test "last name should not be too long" do 
    @user.last_name = "a" * 21
    assert_not @user.valid? 
  end 

  test "first name should be capitalized" do 
    @user.first_name = "test"
    @user.save 
    assert @user.first_name == "Test"
  end

  test "last name should be capitalized" do 
    @user.last_name = "user"
    @user.save 
    assert @user.last_name == "User"
  end

  test "email should be present" do 
    @user.email = "  "
    assert_not @user.valid? 
  end 

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end 

end
