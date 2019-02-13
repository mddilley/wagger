class PlayDatesController < ApplicationController
  def new
    @playdate = PlayDate.new
    @playdate.dog_play_dates.build
    @dogs = current_user.dogs
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
    @dogs = current_user.dogs
  end

  def update
    @playdate = PlayDate.find(params[:id])
    @playdate.update(play_date_params)
    redirect_to play_date_path(@playdate)
  end

  def index
    @playdates = PlayDate.all
  end

  def destroy
    PlayDate.find(params[:id]).destroy
    redirect_to play_dates_path
  end

  private

    def play_date_params
      params.require(:play_date).permit(:name, :location, :date, :time, :dog_limit, dog_play_dates_attributes: [:dog_id, :note, :play_date_id])
    end
end
