class DogPlayDatesController < ApplicationController

  before_action :require_login

  def destroy
    DogPlayDate.find(params[:id]).destroy
    redirect_to play_dates_path
  end

end
