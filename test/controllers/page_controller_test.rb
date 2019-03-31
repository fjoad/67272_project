require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get mainpage" do
    get page_mainpage_url
    assert_response :success
  end

end
