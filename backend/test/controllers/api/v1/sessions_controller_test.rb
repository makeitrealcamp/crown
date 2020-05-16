require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    params = { identifier: "jhonny-bravo", password: "crown-tracker" }
    post api_v1_sessions_url, params: params
    assert_response :success
  end
end
