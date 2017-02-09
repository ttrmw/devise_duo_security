require 'jquery-rails'

module Devise::DuoSecurity
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include Devise::DuoSecurity::Controllers::Helpers
    end

    initializer "devise_duo_security.assets.precompile" do |app|
      app.config.assets.precompile += %w(devise_duo_security/Duo-Web-v2.js)
      app.config.assets.precompile += %w(devise_duo_security/Duo-Frame.css)
    end
  end
end
