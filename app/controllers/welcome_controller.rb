class WelcomeController < ApplicationController
  def index
    redirect_to welcome_path if logged_in?
  end

  def welcome
  end
end
