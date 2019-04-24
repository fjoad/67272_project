require 'test_helper'

class EmployeePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_page_index_url
    assert_response :success
  end

end
