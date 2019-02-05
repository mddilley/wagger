class SessionsController < ApplicationController

  def new
  end

  def create
    find_user_by_email
    if @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
