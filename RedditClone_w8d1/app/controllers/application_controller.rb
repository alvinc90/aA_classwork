class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in? 
        !!current_user
    end

    def login!(user) 
        session[:session_token] = user.reset_session_token! 
    end

    def logout!
        current_user.reset_session_token! 
        session[:session_token] = nil 
        @current_user = nil 
    end

    def require_logged_in! 
        redirect_to new_session_url if !logged_in? 
    end

    def require_moderator_to_be_user
        @sub = current_user.subs.find_by(id: params[:id])
        unless @sub
            flash[:errors] = ["You are not the sub's moderator"]
            redirect_to user_url(current_user)
        end
    end
end

