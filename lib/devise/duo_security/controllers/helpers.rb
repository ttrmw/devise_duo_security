module Devise::DuoSecurity
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        before_filter :handle_two_factor_authentication
      end

      private

      def handle_two_factor_authentication
        unless devise_controller?
          Devise.mappings.keys.flatten.each do |scope|
            if signed_in?(scope)
              if (warden.session(scope)['duo_authenticated'].nil? or !warden.session(scope)['duo_authenticated'])
                handle_failed_second_factor(scope)
              end
              break
            end
          end
        end
      end

      def handle_failed_second_factor(scope)
        if request.format.present? and request.format.html?
          session["#{scope}_return_to"] = "#{request.path}?#{request.query_string}" if request.get?
          redirect_to duo_authentication_path_for(scope)
        else
          render nothing: true, status: :unauthorized
        end
      end

      def duo_authentication_path_for(resource_or_scope = nil)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        change_path = "#{scope}_duo_security_path"
        send(change_path)
      end
    end
  end
end
