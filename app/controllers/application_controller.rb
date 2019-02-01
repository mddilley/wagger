class ApplicationController < ActionController::Base
  helper_method :current_user

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    session[:id]
  end

  def current_user
    User.find(session[:id]) if logged_in?
  end
end
