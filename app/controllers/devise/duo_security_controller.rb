require 'duo_web'
class Devise::DuoSecurityController < DeviseController
  before_action :set_resource
  skip_before_action :verify_authenticity_token
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

  def set_resource
    @resource = send("current_#{resource_name}")
    @verify_path = send("verify_#{resource_name}_duo_security_path")
  end
end
