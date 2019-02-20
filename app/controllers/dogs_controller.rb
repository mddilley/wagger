class DogsController < ApplicationController

  before_action :require_login
  before_action :authorized?, only: [:edit, :update, :destroy, :index, :new, :create]

  def index
    @dogs = find_user_by_id.dogs
  end

  def new
    @dog = find_user_by_id.dogs.build
  end

  def create
    @dog = find_user_by_id.dogs.build(dog_params)
    save_dog_or_show_error
  end

  def show
    find_dog_by_id
  end

  def edit
    find_dog_by_id
  end

  def update
    find_dog_by_id.update(dog_params)
    redirect_to user_dog_path(current_user, @dog)
  end

  def destroy
    find_dog_by_id.destroy
    redirect_to user_dogs_path(current_user)
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :sex, :breed, :age, :weight, :friendly_rating, :aggressive_rating, :fixed, :img)
    end

    def find_dog_by_id
      @dog = Dog.find(params[:id])
    end

    def save_dog_or_show_error
      if @dog.save
        redirect_to user_dog_path(current_user, @dog)
      else
        render :new
      end
    end
end
