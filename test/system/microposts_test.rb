require "application_system_test_case"

class MicropostsTest < ApplicationSystemTestCase
  def setup
    @micro = microposts(:one)
    @user = User.first
    sign_in @user
  end

  test "visiting the index" do
    visit microposts_url
    assert_selector "h1", text: "Micropost"
  end

  test "visiting the show" do
    visit "/posts/#{@micro.id}"
    assert_selector "strong", text: "Content:"
  end

  test "visiting the edit" do
    visit "posts/#{@micro.id}/edit"
    assert_selector "textarea", text: "MyText"
  end

  test "submitting an edit" do
    visit "posts/#{@micro.id}/edit"
    fill_in("Content", with: "NewText")
    fill_in("User", with: "#{@user.id}")
    click_on('Update Micropost')
    assert_selector "p", text: "Content: NewText"
  end

  test "submittin a destroy" do
    visit microposts_url
    accept_alert do
      click_on("Destroy", match: :first)
    end
    assert_selector "p", text: "Micropost was successfully destroyed."
  end

end
