class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!
    
  def create
    @ski_resort=SkiResort.find(params[:id])
    @review=Review.new(review_params)
    @review.customer_id=current_customer.id
    @review.ski_resort_id=@ski_resort.id
    @review.save
  end
  
  def destroy
    @ski_resort=SkiResort.find(params[:id])
    @post_comment=@ski_resort.comments
    Review.find_by(id: params[:id], ski_resort_id: params[:ski_resort_id]).destroy
  end
  
  
  private
  
  def review_params
    params.require(:review), permit(:comment)
  end
end
