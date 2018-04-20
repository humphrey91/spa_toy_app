require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  def setup
    @user = User.create(first_name: "Josh", last_name: "Humphrey", email: "Humphrey.js@gmail.com", password: "123456", password_confirmation: "123456")
  end

  test "visiting the sign_in" do
    visit new_user_session_url
    assert_selector "h2", text: "Log in"
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
    fill_in("First name", with: "test")
    fill_in("Last name", with: "user")
    fill_in("Email", with: "user@gmail.com")
    fill_in("Password", with: "123456")
    fill_in("Password confirmation", with: "123456")
    click_on("Sign up")
    assert_selector "p", text: "Welcome! You have signed up successfully."
  end
  
end
