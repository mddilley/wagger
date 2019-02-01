class ApplicationController < ActionController::Base

  def login(user)
    session[:id] = user.id
  end
end
