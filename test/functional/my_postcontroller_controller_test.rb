require 'test_helper'

class MyPostcontrollerControllerTest < ActionController::TestCase
  test "should get postIndex" do
    get :postIndex
    assert_response :success
  end

end
