class SessionsController < ApplicationController

  def new
  end

  def create
    find_user_by_email
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to welcome_path
    else
      flash[:invalid] = %Q[Please fill all fields with valid input, or visit <a href="#{new_user_path}">Signup</a> to create a new account.]
      redirect_to login_path
      # redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
