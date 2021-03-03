require 'test_helper'

class GroupMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_messages_index_url
    assert_response :success
  end

end
