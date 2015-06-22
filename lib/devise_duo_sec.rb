require 'devise'
require 'devise/duo_security/controllers/helpers'
require 'devise/duo_security/engine'
require 'duo_web'

module Devise
  module DuoSecurity
    class Configuration
      attr_accessor :app_secret, :ikey, :skey, :host
    end

    class << self
      attr_writer :configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end

# TODO: Isn't there a better way?
DuoSecurity = Devise::DuoSecurity

Devise.add_module :duo_security, :model => 'devise_duo_sec', :controller => :duo_security, :route => :duo_security

module ActionDispatch::Routing
  class Mapper
    protected

      def devise_duo_security(mapping, controllers)
        resource :duo_security, :only => [:show], :path => mapping.path_names[:duo_security], :controller => controllers[:duo_security] do
          collection do
            post :verify
          end
        end
      end
  end
end
