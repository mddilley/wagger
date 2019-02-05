class PlayDatesController < ApplicationController
  def new
    @playdate = PlayDate.new
  end

  def create
    @playdate = PlayDate.new(play_date_params)
    if @playdate.save
      redirect_to play_date_path(@playdate)
    else
      render :new
    end
  end

  def show
    @playdate = PlayDate.find(params[:id])
  end

  def edit
    @playdate = PlayDate.find(params[:id])
  end

  def update
    @playdate = PlayDate.find(params[:id])
    @playdate.update(play_date_params)
    redirect_to play_date_path(@playdate)
  end

  private

    def play_date_params
      params.require(:play_date).permit(:location, :date, :time, :dog_limit)
    end
end
