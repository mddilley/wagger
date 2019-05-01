class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def logged_in?
    session[:id]
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  private

    def login(user)
      session[:id] = user.id
    end

    def require_login
      redirect_to root_path unless session[:id]
    end

    def find_user_by_id
      params[:user_id] ? @user = User.find(params[:user_id]) : @user = User.find(params[:id])
    end

    def authorized?
      redirect_to welcome_path unless find_user_by_id == current_user
    end

    def record_not_found
      redirect_to root_path
    end

    def header_vary
      response.header["Vary"] = "Accept"
      binding.pry
    end

end
