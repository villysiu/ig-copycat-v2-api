require "test_helper"

class Users::AvatarControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_avatar_create_url
    assert_response :success
  end

  test "should get update" do
    get users_avatar_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_avatar_destroy_url
    assert_response :success
  end
end
