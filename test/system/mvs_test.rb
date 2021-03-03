require "application_system_test_case"

class MvsTest < ApplicationSystemTestCase
  setup do
    @mv = mvs(:one)
  end

  test "visiting the index" do
    visit mvs_url
    assert_selector "h1", text: "Mvs"
  end

  test "creating a Mv" do
    visit mvs_url
    click_on "New Mv"

    fill_in "Name", with: @mv.name
    click_on "Create Mv"

    assert_text "Mv was successfully created"
    click_on "Back"
  end

  test "updating a Mv" do
    visit mvs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @mv.name
    click_on "Update Mv"

    assert_text "Mv was successfully updated"
    click_on "Back"
  end

  test "destroying a Mv" do
    visit mvs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mv was successfully destroyed"
  end
end
