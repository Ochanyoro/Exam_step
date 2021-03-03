require "test_helper"

class ImsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @im = ims(:one)
  end

  test "should get index" do
    get ims_url
    assert_response :success
  end

  test "should get new" do
    get new_im_url
    assert_response :success
  end

  test "should create im" do
    assert_difference('Im.count') do
      post ims_url, params: { im: { name: @im.name } }
    end

    assert_redirected_to im_url(Im.last)
  end

  test "should show im" do
    get im_url(@im)
    assert_response :success
  end

  test "should get edit" do
    get edit_im_url(@im)
    assert_response :success
  end

  test "should update im" do
    patch im_url(@im), params: { im: { name: @im.name } }
    assert_redirected_to im_url(@im)
  end

  test "should destroy im" do
    assert_difference('Im.count', -1) do
      delete im_url(@im)
    end

    assert_redirected_to ims_url
  end
end
