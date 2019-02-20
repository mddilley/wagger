class SessionsController < ApplicationController

  def new
    redirect_to welcome_path if logged_in?
  end

  def create
    if auth
      @user = find_or_create_user_from_facebook
      login(@user)
      redirect_to welcome_path
    elsif find_user_by_email
      authenticate(@user)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

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
      u.name = auth['info']['name'].split(" ")[0]
      u.email = auth['info']['email']
      u.password = auth['credentials']['token'][0..9]
      u.password_confirmation = auth['credentials']['token'][0..9]
    end

    def authenticate(user)
      if user && user.authenticate(params[:password])
        login(user)
        redirect_to welcome_path
      else
        flash[:invalid] = %Q[Please fill all fields with valid input, or visit <a href="#{new_user_path}">Signup</a> to create a new account.]
        redirect_to login_path
      end
    end

end
