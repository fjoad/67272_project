require 'test_helper'

class ManagerViewProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_view_profile_index_url
    assert_response :success
  end

end
