class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    #CRLLL
    def current_user                #col_name          hash[:12345] 
        @current_user ||= User.find_by(session_token: session[:session_token]) 
                       # User.find(session_token: 'zRlJ1tlDgpi5vmRGGZgJjw') 
    end
    
    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
        
    end

    def logged_in? 
        !!current_user 
    end

    def require_logged_in!
        redirect_to new_sessions_url if !logged_in?
    end

end
