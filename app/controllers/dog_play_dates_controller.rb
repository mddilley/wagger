class DogPlayDatesController < ApplicationController

  before_action :require_login

  def destroy
    binding.pry
    find_dog_play_date_by_id.destroy
    redirect_to play_dates_path
  end

  def create
    @dogplaydate = DogPlayDate.new(dog_play_date_params)
    @dogplaydate.save
    redirect_to play_date_path(@dogplaydate.play_date)
  end

  private

    def find_dog_play_date_by_id
      DogPlayDate.find(params[:id])
    end

    def dog_play_date_params
      params.require(:dog_play_date).permit(:dog_id, :note, :play_date_id)
    end

end
