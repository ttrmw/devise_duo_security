$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise/duo_security/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_duo_sec"
  s.version     = Devise::DuoSecurity::VERSION
  s.authors     = ["Greg Molnar"]
  s.email       = ["greg.molnar@mwrinfosecurity.com"]
  s.homepage    = "https://rubygems.org"
  s.summary     = "A gem to support duosecurity 2 factor auth."
  s.description = "A gem to support duosecurity 2 factor auth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 5.0.2'
  s.add_dependency "devise", "~> 4.x"
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'capybara', '~> 2.7', '>= 2.7.1'
  s.add_development_dependency 'capybara_minitest_spec'

  s.add_development_dependency 'sinatra'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'pry'

  s.add_development_dependency 'launchy', '~> 2.4.3'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'jquery-rails', '~> 4.3', '>= 4.3.1'
end
