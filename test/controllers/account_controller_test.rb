require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get createAccount" do
    get :createAccount
    assert_response :success
  end

end
