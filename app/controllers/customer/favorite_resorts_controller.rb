class Customer::FavoriteResortsController < ApplicationController
  before_action :authenticate_customer!
    
  def create
    @ski_resort=SkiResort.find(params[:id])
    @favorite_resort=current_customer.favorite_resorts.new(ski_resort: @ski_resort)
    if @favorite_resort.save
      redirect_to ski_resort_path(@ski_resort)
    end
  end
  
  def destroy
    @ski_resort=SkiResort.find(params[:id])
    favorite_resort=@ski_resort.favorite_resorts.find_by(customer_id: current_customer.id)
    if favorite_resort.destroy
      redirect_to favorite_resorts_path
    end
  end
  
  def index
    @favorite_resorts=FavoriteResort.page(params[:page])
    @favorite_resorts_all=FavoriteResort.all
  end
  
end
