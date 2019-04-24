require 'test_helper'

class ManagerPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_page_index_url
    assert_response :success
  end

end
