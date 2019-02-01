class SessionsController < ApplicationController

  def new
  end

  def create
    if find_user
      @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  private

    def find_user
      @user = User.find_by(email: params[:email])
    end
end
