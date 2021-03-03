require "application_system_test_case"

class ImsTest < ApplicationSystemTestCase
  setup do
    @im = ims(:one)
  end

  test "visiting the index" do
    visit ims_url
    assert_selector "h1", text: "Ims"
  end

  test "creating a Im" do
    visit ims_url
    click_on "New Im"

    fill_in "Name", with: @im.name
    click_on "Create Im"

    assert_text "Im was successfully created"
    click_on "Back"
  end

  test "updating a Im" do
    visit ims_url
    click_on "Edit", match: :first

    fill_in "Name", with: @im.name
    click_on "Update Im"

    assert_text "Im was successfully updated"
    click_on "Back"
  end

  test "destroying a Im" do
    visit ims_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Im was successfully destroyed"
  end
end
