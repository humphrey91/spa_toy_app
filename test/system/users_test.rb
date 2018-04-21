require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  def setup
    @user = User.create(first_name: "Josh", last_name: "Humphrey", email: "Humphrey.js@gmail.com", password: "123456", password_confirmation: "123456")
  end

  test "visiting the sign_in" do
    visit new_user_session_url
    assert_selector "h4", text: "Log In"
  end

  test "signing in a user" do
    visit new_user_session_url
    fill_in("Email", with: "Humphrey.js@gmail.com")
    fill_in("Password", with: "123456")
    click_on("Log in")
    assert_selector "p", text: "Signed in successfully."
  end

  test "signing up a new user" do
    visit new_user_registration_path
    fill_in("user_first_name", with: "test")
    fill_in("user_last_name", with: "user")
    fill_in("user_email", with: "user@gmail.com")
    fill_in("user_password", with: "123456")
    fill_in("user_password_confirmation", with: "123456")
    click_on("Get Started")
    assert_selector "p", text: "Welcome! You have signed up successfully."
  end
  
end
