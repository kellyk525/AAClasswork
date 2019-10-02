

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :logged_in?

    def login!(user)
        @current_user = user
        session[:session_token] = @current_user.reset_session_token!
        #session[:session_token] = user.reset_session_token! (this also works)
    end

    def logged_in?
        !!current_user
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_user!
        # redirect_to new_user_url if current_user (require no user)
        redirect_to new_session_url if current_user.nil?
    end
end


