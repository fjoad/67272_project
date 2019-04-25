require 'test_helper'

class GuestFlavorViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guest_flavor_view_index_url
    assert_response :success
  end

end
