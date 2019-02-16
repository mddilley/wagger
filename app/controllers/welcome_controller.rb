class WelcomeController < ApplicationController

  before_action :require_login, only: [:welcome]

  def index
    redirect_to welcome_path if logged_in?
  end

  def welcome
  end
end
