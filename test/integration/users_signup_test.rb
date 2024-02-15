require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'invalid number of errors after nil auth' do
    post users_path, params: { user: { name: nil,
                                       email: nil,
                                       password:              nil,
                                       password_confirmation: nil } }
    assert_select 'div#error_explanation' do
      assert_select 'ul' do
        assert_select 'li', 4
      end
    end
  end

  test 'valid signup information' do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Test",
                                        email: "some@email.com",
                                        password: "somepass",
                                        password_confirmation: "somepass" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    assert_not flash.empty? # or .nil?
    assert_equal flash[:success], "Welcome, your registration is success"
  end
end
