require 'test_helper'

class Devise::DuoSecurityTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Devise::DuoSecurity
  end
end
