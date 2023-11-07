require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Cr9Co0"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | Cr9Co0"
  end

  test "should_get_about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | Cr9Co0"
  end
end
