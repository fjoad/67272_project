require 'test_helper'

class ManagerShiftInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_shift_info_index_url
    assert_response :success
  end

end
