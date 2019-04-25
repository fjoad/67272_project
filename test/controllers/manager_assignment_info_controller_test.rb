require 'test_helper'

class ManagerAssignmentInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_assignment_info_index_url
    assert_response :success
  end

end
