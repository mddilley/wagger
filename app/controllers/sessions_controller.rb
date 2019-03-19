class SessionsController < ApplicationController

  def new
    redirect_to welcome_path if logged_in?
  end

  def create
    if auth
      @user = find_or_create_user_from_facebook
      login(@user)
      redirect_to welcome_path
    else
      authenticate_user
    end
  end

  def destroy
    logout
  end

  private

    def logout
      session.clear
      redirect_to root_path
    end

    def find_user_by_email
      @user = User.find_by(email: params[:email])
    end

    def auth
      request.env['omniauth.auth']
    end

    def find_or_create_user_from_facebook
      User.find_or_create_by(email: auth['info']['email']) do |u|
        assign_facebook_attributes(u)
      end
    end

    def assign_facebook_attributes(user)
      user.name = auth['info']['name'].split(" ")[0]
      user.email = auth['info']['email']
      user.password = auth['credentials']['token'][0..9]
      user.password_confirmation = auth['credentials']['token'][0..9]
    end

    def authenticate_user
      find_user_by_email
      if @user && @user.authenticate(params[:password])
        login(@user)
        redirect_to welcome_path
      else
        flash[:invalid] = %Q[Please fill all fields with valid input, or visit <a href="#{new_user_path}">Signup</a> to create a new account.]
        redirect_to login_path
      end
    end

end
