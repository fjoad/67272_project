require 'test_helper'

class GuestFlavorStoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guest_flavor_store_index_url
    assert_response :success
  end

end
