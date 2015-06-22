require 'test_helper'

class Devise::DuoSecurityTest < ActiveSupport::TestCase
  test "should be able to set and get configuration" do
    c = Devise::DuoSecurity.configuration
    c.app_secret = "secret"
    c.ikey = "ikey"
    c.skey = "skey"
    c.host = "host"

    assert_equal "secret", c.app_secret
    assert_equal "ikey", c.ikey
    assert_equal "skey", c.skey
    assert_equal "host", c.host
  end
end
