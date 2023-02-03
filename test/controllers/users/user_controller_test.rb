require "test_helper"

class Users::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get users_user_update_url
    assert_response :success
  end
end
