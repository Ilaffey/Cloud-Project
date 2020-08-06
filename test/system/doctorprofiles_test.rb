require "application_system_test_case"

class DoctorprofilesTest < ApplicationSystemTestCase
  setup do
    @doctorprofile = doctorprofiles(:one)
  end

  test "visiting the index" do
    visit doctorprofiles_url
    assert_selector "h1", text: "Doctorprofiles"
  end

  test "creating a Doctorprofile" do
    visit doctorprofiles_url
    click_on "New Doctorprofile"

    fill_in "Address", with: @doctorprofile.address
    fill_in "Contactnumber", with: @doctorprofile.contactNumber
    fill_in "Name", with: @doctorprofile.name
    fill_in "User", with: @doctorprofile.user_id
    click_on "Create Doctorprofile"

    assert_text "Doctorprofile was successfully created"
    click_on "Back"
  end

  test "updating a Doctorprofile" do
    visit doctorprofiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @doctorprofile.address
    fill_in "Contactnumber", with: @doctorprofile.contactNumber
    fill_in "Name", with: @doctorprofile.name
    fill_in "User", with: @doctorprofile.user_id
    click_on "Update Doctorprofile"

    assert_text "Doctorprofile was successfully updated"
    click_on "Back"
  end

  test "destroying a Doctorprofile" do
    visit doctorprofiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Doctorprofile was successfully destroyed"
  end
end
