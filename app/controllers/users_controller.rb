class UsersController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  before_action :authorized?, only: [:edit, :update, :show]

  def new
    @user = User.new
    @user.dogs.build
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
    find_user_by_id
  end

  def edit
    find_user_by_id
  end

  def update
    find_user_by_id
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :hobbies, :age, :city, :state, :admin, dogs_attributes: [:name, :sex])
    end

end
