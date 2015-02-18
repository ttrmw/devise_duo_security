# Devise::DuoSecurity

## Install

Add the gem to your gemfile:

```ruby
gem 'devise_duo_security'
```

Add duo_auth to your devise model:

```ruby
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :duo_security
```

Create an initializer and set your DuoSecurity config:
```ruby
Devise::DuoSecurity.configure do |config|
  config.app_secret = ENV["DUO_APP_SECRET"]
  config.ikey = ENV["DUO_IKEY"]
  config.skey = ENV["DUO_SKEY"]
  config.host = ENV["DUO_API_HOST"]
end
```

## Development

# Setup gem inabox

```ruby
  gem inabox -c

  Enter the root url for your personal geminabox instance (e.g. http://gems/).
  Host: http://localhost:6789
```

# Ready for publishing]

Bump the version number

Make a new gem version

```ruby
gem build devise_duo_security.gemspec
```

Push it to the gem server

Make sure you are connected to Thor first:

```ruby
  ssh thor

  gem inabox pkg/devise_duo_sec-<version>.gem
```