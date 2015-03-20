require 'duo_web'

class Devise::DuoSecurityController < DeviseController
  prepend_before_action :set_resource
  prepend_before_action :authenticate_scope!, only: [:show]
  skip_before_action :verify_authenticity_token

  include Devise::Controllers::Helpers
  include Duo

  def show
    @host = DuoSecurity.configuration.host
    @signature = Duo.sign_request(DuoSecurity.configuration.ikey, DuoSecurity.configuration.skey, DuoSecurity.configuration.app_secret, @resource.email)
  end

  def verify
    authenticated_username = Duo.verify_response(DuoSecurity.configuration.ikey, DuoSecurity.configuration.skey, DuoSecurity.configuration.app_secret, params[:sig_response])
    if authenticated_username
      warden.session(resource_name)['duo_authenticated'] = true
      redirect_to root_path
    else
      redirect_to send("#{resource_name}_duo_security_path")
    end
  end

  private

  def authenticate_scope!
    # because we are a type of DeviseController authentication will not run again
    # hence we need to set force => true to ensure a user is logged in!
    send(:"authenticate_#{resource_name}!", :force => true)
    self.resource = send("current_#{resource_name}")
    @resource = resource
  end

  def set_resource
    @verify_path = send("verify_#{resource_name}_duo_security_path")
  end
end
