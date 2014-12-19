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

  s.add_dependency "rails", "~> 4.x"
  s.add_dependency "devise", "~> 3.x"

  s.add_development_dependency "sqlite3"
end
