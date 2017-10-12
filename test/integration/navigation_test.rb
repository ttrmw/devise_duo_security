require "test_helper"
class NavigationTest < ActionDispatch::IntegrationTest
  setup do
    @user = create_user(:email => 'foo@bar.com')
  end

  test "should redirect user to login path if not logged in" do
    get "/users/duo_security"
    follow_redirect!
    assert_equal "/users/sign_in", path
  end

  # TODO: How to test that duo security iframe is shown??
  test "should show duo security screen on login" do
    fill_sign_in_form('foo@bar.com', '12345678')
    assert_equal "/users/duo_security", page.current_path
  end

  test "it should redirect to initial path after authentication" do
    get "/users/duo_security"
    assert_redirected_to "/users/sign_in"
    post "/users/duo_security/verify", params: { email: 'foo@bar.com', password: '12345678' }
    assert_redirected_to session["user_return_to"]
  end
end
