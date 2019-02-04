class DogsController < ApplicationController
  def index
    @dogs = User.find(params[:user_id]).dogs
  end

  def new
    @dog = User.find(params[:user_id]).dogs.build
  end

  def create
    @dog = User.find(params[:user_id]).dogs.build(dog_params)
    if @dog.save
      redirect_to user_dog_path(current_user, @dog)
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :sex, :breed, :age, :weight, :friendly_rating, :aggressive_rating, :fixed)
    end
end
