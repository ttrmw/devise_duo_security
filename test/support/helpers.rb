$email_count ||= 0
def generate_unique_email
  $email_count += 1
  "test#{$email_count}@example.com"
end

def valid_attributes(attributes={})
  { :email => generate_unique_email,
    :password => '12345678',
    :password_confirmation => '12345678' }.update(attributes)
end

def new_user(attributes={})
  User.new(valid_attributes(attributes))
end

def create_user(attributes={})
  User.create!(valid_attributes(attributes))
end

def fill_sign_in_form(email, password, form_selector = nil, sign_in_path = nil)
  form_selector ||= '#new_user'
  sign_in_path  ||= new_user_session_path

  visit sign_in_path
  within(form_selector) do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
  end
  click_on 'Log in'
end

def duo_init
  Devise::DuoSecurity.configure do |config|
    config.app_secret = ""
    config.ikey = ""
    config.skey = ""
    config.host = ""
  end
end