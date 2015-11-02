require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @albums = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end
end
