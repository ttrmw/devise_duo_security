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
