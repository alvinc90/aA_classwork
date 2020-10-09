class ApplicationController < ActionController::Base
  ## C  R  L  L  L 

  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_log_in!
    render json: ['Invalid credentials'] unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
  end

end
