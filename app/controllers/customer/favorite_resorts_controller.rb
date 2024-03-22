class Customer::FavoriteResortsController < ApplicationController
  before_action :authenticate_customer!
    
  def create
    @ski_resort_id=SkiResort.find(params[:id])
    @favorite_resort=current_customer.favorite_resorts.new(ski_resort_id: @ski_resort_id)
    if @favorite_resort.save!
      redirect_to ski_resort_path(@ski_resort_id)
    end
  end
  
  def destroy
    @favorite_resort=FavoriteResort.find(params[:id])
    @ski_resort=SkiResort.find(params[:id])
    if @favorite_resort.destroy
      redirect_to ski_resort_path(@ski_resort)
    end
  end
  
  def index
    @favorite_resorts=FavoriteResort.all
  end
  
end
