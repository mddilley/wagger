class DogPlayDatesController < ApplicationController

  before_action :require_login

  def destroy
    find_dog_play_date_by_id.destroy
    redirect_to play_dates_path
  end

  private

    def find_dog_play_date_by_id
      DogPlayDate.find(params[:id])
    end

end
