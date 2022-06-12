require "test_helper"

class Public::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_comments_new_url
    assert_response :success
  end
end
