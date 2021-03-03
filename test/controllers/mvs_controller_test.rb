require "test_helper"

class MvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mv = mvs(:one)
  end

  test "should get index" do
    get mvs_url
    assert_response :success
  end

  test "should get new" do
    get new_mv_url
    assert_response :success
  end

  test "should create mv" do
    assert_difference('Mv.count') do
      post mvs_url, params: { mv: { name: @mv.name } }
    end

    assert_redirected_to mv_url(Mv.last)
  end

  test "should show mv" do
    get mv_url(@mv)
    assert_response :success
  end

  test "should get edit" do
    get edit_mv_url(@mv)
    assert_response :success
  end

  test "should update mv" do
    patch mv_url(@mv), params: { mv: { name: @mv.name } }
    assert_redirected_to mv_url(@mv)
  end

  test "should destroy mv" do
    assert_difference('Mv.count', -1) do
      delete mv_url(@mv)
    end

    assert_redirected_to mvs_url
  end
end
