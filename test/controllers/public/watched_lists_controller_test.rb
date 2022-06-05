require "test_helper"

class Public::WatchedListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_watched_lists_index_url
    assert_response :success
  end
end
