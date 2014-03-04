require 'test_helper'

class BuilderControllerTest < ActionController::TestCase
  test "should get timbrar" do
    get :timbrar
    assert_response :success
  end

end
