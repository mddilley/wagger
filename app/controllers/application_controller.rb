class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    session[:id]
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  private

    def require_login
      redirect_to root_path unless session[:id]
    end

    def find_user_by_id
      @user = User.find(params[:id])
    end

    def find_user_by_email
      @user = User.find_by(email: params[:email])
    end

    def find_dog_by_id
      @dog = Dog.find(params[:id])
    end

    def authorized?
      redirect_to user_path(current_user) unless find_user_by_id == current_user
    end
end
