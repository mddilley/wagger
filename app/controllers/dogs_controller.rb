class DogsController < ApplicationController
  def index
    @dogs = User.find(params[:user_id]).dogs
  end
end
