require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alex)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    # old solution by one template
    # assert_template 'users/edit'
    assert_template 'users/edit'

    patch user_path(@user), params: { user: { name:"",
                                              email:"foo@invalid",
                                              password: "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "form contains 4 errors" do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), params: { user: { name:"",
                                              email:"foo@invalid",
                                              password: "foo",
                                              password_confirmation: "bar" } }

    assert_select "div#error_explanation" do
      assert_select 'ul' do
        assert_select 'li', 4
      end
    end
  end

  # test "successful edit" do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   name = "foo bar"
  #   email = "foo@bar.com"
  #   patch user_path(@user), params: { user: { name: name, 
  #                                             email: email,
  #                                             password:              "", 
  #                                             password_confirmation: "" } }

  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name, @user.name
  #   assert_equal email, @user.email
  # end
  test "succesful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "foo bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email

    assert_nil session[:forwarding_url]
    assert_redirected_to @user
  end
end