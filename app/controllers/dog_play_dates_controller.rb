class DogPlayDatesController < ApplicationController

  def destroy
    DogPlayDate.find(params[:id]).destroy
    redirect_to play_dates_path
  end

end
