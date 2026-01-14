class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(resto_params)
    if @restaurant.save
    redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new(restaurant_id: @restaurant.id)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(resto_params)
    redirect_to @restaurant
  end

private

  def resto_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
