require "application_system_test_case"

class LoginpagesTest < ApplicationSystemTestCase
  setup do
    @loginpage = loginpages(:one)
  end

  test "visiting the index" do
    visit loginpages_url
    assert_selector "h1", text: "Loginpages"
  end

  test "creating a Loginpage" do
    visit loginpages_url
    click_on "New Loginpage"

    fill_in "Index", with: @loginpage.index
    click_on "Create Loginpage"

    assert_text "Loginpage was successfully created"
    click_on "Back"
  end

  test "updating a Loginpage" do
    visit loginpages_url
    click_on "Edit", match: :first

    fill_in "Index", with: @loginpage.index
    click_on "Update Loginpage"

    assert_text "Loginpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Loginpage" do
    visit loginpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loginpage was successfully destroyed"
  end
end
