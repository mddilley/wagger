class UsersController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    find_user
  end

  def update
    find_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :hobbies, :age, :city, :state, :admin)
    end

    def require_login
      redirect_to root_path unless session[:id]
    end

    def find_user
      @user = User.find(params[:id])
    end

end
