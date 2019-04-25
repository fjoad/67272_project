require 'test_helper'

class LoginpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loginpage = loginpages(:one)
  end

  test "should get index" do
    get loginpages_url
    assert_response :success
  end

  test "should get new" do
    get new_loginpage_url
    assert_response :success
  end

  test "should create loginpage" do
    assert_difference('Loginpage.count') do
      post loginpages_url, params: { loginpage: { index: @loginpage.index } }
    end

    assert_redirected_to loginpage_url(Loginpage.last)
  end

  test "should show loginpage" do
    get loginpage_url(@loginpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_loginpage_url(@loginpage)
    assert_response :success
  end

  test "should update loginpage" do
    patch loginpage_url(@loginpage), params: { loginpage: { index: @loginpage.index } }
    assert_redirected_to loginpage_url(@loginpage)
  end

  test "should destroy loginpage" do
    assert_difference('Loginpage.count', -1) do
      delete loginpage_url(@loginpage)
    end

    assert_redirected_to loginpages_url
  end
end
