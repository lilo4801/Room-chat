require 'test_helper'

class SendInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get send_invitations_index_url
    assert_response :success
  end

end
