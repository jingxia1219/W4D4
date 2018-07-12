class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logout
  helper_method :logged_in?

  def login(user)
    session[:session_token] = user.session_token
  end

  def current_user
    # debugger
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
     !current_user.nil?
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
