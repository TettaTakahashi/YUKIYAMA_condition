class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @ski_resort=SkiResort.find(params[:ski_resort_id])
    @review=Review.find(params[:id])
    @review.destroy
    redirect_to admin_ski_resort_path(@ski_resort)
  end
end
