# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

require "capybara"
require "capybara/rails"
require "capybara_minitest_spec"

# require 'vcr'

# VCR.configure do |config|
#   config.cassette_library_dir = "fixtures/vcr_cassettes"
#   config.hook_into :webmock
#   config.debug_logger = File.open("record.log", 'w')
#   # config.allow_http_connections_when_no_cassette = true
#   config.ignore_hosts '127.0.0.1', 'localhost'
# end

require 'webmock/minitest'

WebMock.disable_net_connect!(allow_localhost: true)

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup  do
  end

  teardown do
    Capybara.reset_sessions!
  end
end