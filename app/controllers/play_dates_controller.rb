class PlayDatesController < ApplicationController

  before_action :require_login
  before_action :authorized?, only: [:destroy]

  def new
    @playdate = PlayDate.new
    @playdate.dog_play_dates.build
    @dogs = current_user.dogs
  end

  def create
    @playdate = PlayDate.new(play_date_params)
    @dogs = current_user.dogs
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
    @playdate.dog_play_dates.build
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
      params.require(:play_date).permit(:name, :location, :date, :time, :dog_limit, :user_id, dog_play_dates_attributes: [:id, :dog_id, :note])
    end
end
