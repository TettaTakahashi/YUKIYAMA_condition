class Customer::FavoriteResortsController < ApplicationController
  before_action :authenticate_customer!
    
  def create
    @customer=current_customer.id
    @ski_resort=SkiResort.find(params[:id])
    @favorite_resort=FavoriteResort.new(ski_resort_id: @ski_resort_id, customer_id: @customer_id)
    if @favorite_resort.save
      redirect_to ski_resort_path(@ski_resort)
    end
  end
  
  def destroy
    @favorite_resort=FavoriteResort.find(params[:id])
    if @favorite_resort.destroy
      redirect_to ski_resort_path(@ski_resort)
    end
  end
  
end
