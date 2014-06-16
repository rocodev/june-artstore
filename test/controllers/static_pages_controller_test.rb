require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get LayoutSample" do
    get :LayoutSample
    assert_response :success
  end

end
