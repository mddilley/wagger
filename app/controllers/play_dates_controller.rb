class PlayDatesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :require_login
  before_action :play_date_owner?, only: [:destroy, :edit]

  def new
    @playdate = PlayDate.new
    current_user_dogs
  end

  def create
    @playdate = PlayDate.new(play_date_params)
    current_user_dogs
    save_play_date_or_show_error
  end

  def show
    find_play_date
    respond_to do |format|
      format.json { render json: @playdate }
      format.html { render 'play_dates/show' }
    end
  end

  def edit
    find_play_date
    current_user_dogs
  end

  def update
    find_play_date
    @playdate.update(play_date_params)
    redirect_to play_date_path(@playdate)
  end

  def index
    @playdate = PlayDate.new
    populate_play_dates
  end

  def past
    @playdates = PlayDate.past.by_date
    render "index"
  end

  def destroy
    find_play_date.destroy
    redirect_to play_dates_path
  end

  private

    def play_date_params
      params.require(:play_date).permit(:name, :location, :date, :time, :dog_limit, :user_id, dog_play_dates_attributes: [:id, :dog_id, :note])
    end

    def find_play_date
      @playdate = PlayDate.find(params[:id])
    end

    def play_date_owner?
      redirect_to root_path unless find_play_date.user_id == current_user.id
    end

    def current_user_dogs
      @dogs = current_user.dogs
    end

    def save_play_date_or_show_error
      if @playdate.save
        redirect_to play_date_path(@playdate)
      else
        render :new
      end
    end

    def populate_play_dates
      if params[:id]
        @playdates = PlayDate.current.by_date.my_play_dates(params[:id])
      else
        @playdates = PlayDate.current.by_date
      end
    end

end
