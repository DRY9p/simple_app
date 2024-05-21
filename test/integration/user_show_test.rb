require "test_helper"

class UserShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @inactive_user = users(:inactive)
    @activated_user = users(:ficio)
  end

  test "should redirect when user not activated" do
    get users_path(@inactive_user)
    assert_response :redirect
    # find which statement is redirecting to login_path
    assert_redirected_to login_path
  end

   test "should redirect when user activated" do
    get user_path(@activated_user)
    assert_response :ok
    assert_template 'users/show'
   end
end
