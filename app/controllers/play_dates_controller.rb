class PlayDatesController < ApplicationController
  def new
    @playdate = PlayDate.new
  end

  def create
    binding.pry
    @playdate = PlayDate.new(play_date_params)
    if @playdate.save
      redirect_to play_date_path(@playdate)
    else
      render :new
    end
  end

  private

    def play_date_params
      params.require(:play_date).permit(:location, :date, :time, :dog_limit)
    end
end
