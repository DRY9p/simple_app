require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    base_title = 'Cr9Co0'

    assert_equal base_title, full_title
    assert_equal "About | #{base_title}", full_title('About')
    assert_equal "Help | #{base_title}", full_title('Help')
    assert_equal "Contact | #{base_title}", full_title('Contact')
    assert_equal "Sign up | #{base_title}", full_title('Sign up')
  end
end
