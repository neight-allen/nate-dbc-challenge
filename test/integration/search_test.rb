require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest
  # include Devise::TestHelpers
  fixtures :all
  setup do
    @new_user = User.new email: 'anyone@gmail.com', password: '1234567890', password_confirmation: '1234567890'
    @new_user.save
    get "/users/sign_in"
    assert_response :success
    post_via_redirect "/users/sign_in", email: @new_user.email, password: @new_user.password
  end

  test "can find songs" do
    
    get "/search/index", "q" =>  { "name_cont" =>  "song"}
    assert_response :success
    assert_template "index"

    results = css_select(".row li")
    assert_not_empty results
  end

  test "can't find gibberish" do
    
    get "/search/index", "q" =>  { "name_cont" =>  "fdasjoifj8oijklnasdf"}
    assert_response :success
    assert_template "index"

    results = css_select(".row li")
    assert_empty results
  end
end
