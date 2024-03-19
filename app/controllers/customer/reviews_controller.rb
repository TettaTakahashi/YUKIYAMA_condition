class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @ski_resort=SkiResort.find(params[:ski_resort_id])
    @review=Review.new(review_params)
    @review.customer_id=current_customer.id
    @review.ski_resort_id=@ski_resort.id
    @review.save
    redirect_to ski_resort_path(@ski_resort)
  end
  
  def destroy
    @ski_resort=SkiResort.find(params[:ski_resort_id])
    @review=Review.find(params[:id])
    @review.destroy
    redirect_to ski_resort_path(@ski_resort)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:comment)
  end
end
