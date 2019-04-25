require 'test_helper'

class EmployeeViewProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_view_profile_index_url
    assert_response :success
  end

end
