require 'test_helper'

class LifesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
