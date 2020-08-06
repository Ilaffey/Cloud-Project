require 'test_helper'

class DoctorprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctorprofile = doctorprofiles(:one)
  end

  test "should get index" do
    get doctorprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_doctorprofile_url
    assert_response :success
  end

  test "should create doctorprofile" do
    assert_difference('Doctorprofile.count') do
      post doctorprofiles_url, params: { doctorprofile: { address: @doctorprofile.address, contactNumber: @doctorprofile.contactNumber, name: @doctorprofile.name, user_id: @doctorprofile.user_id } }
    end

    assert_redirected_to doctorprofile_url(Doctorprofile.last)
  end

  test "should show doctorprofile" do
    get doctorprofile_url(@doctorprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctorprofile_url(@doctorprofile)
    assert_response :success
  end

  test "should update doctorprofile" do
    patch doctorprofile_url(@doctorprofile), params: { doctorprofile: { address: @doctorprofile.address, contactNumber: @doctorprofile.contactNumber, name: @doctorprofile.name, user_id: @doctorprofile.user_id } }
    assert_redirected_to doctorprofile_url(@doctorprofile)
  end

  test "should destroy doctorprofile" do
    assert_difference('Doctorprofile.count', -1) do
      delete doctorprofile_url(@doctorprofile)
    end

    assert_redirected_to doctorprofiles_url
  end
end
