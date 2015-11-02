require 'test_helper'
# require 'devise'

class AlbumsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    # @albums = albums(:one)
    sign_in User.first
  end

  test "Are albums loading?" do
    assert_not_nil Album.first.artist
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end
end
