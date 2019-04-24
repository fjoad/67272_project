require 'test_helper'

class AdminPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_index_url
    assert_response :success
  end

end
