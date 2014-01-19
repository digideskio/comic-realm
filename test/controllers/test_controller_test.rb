require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get test_editor" do
    get :test_editor
    assert_response :success
  end

end
