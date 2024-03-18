class Customer::SkiResortsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @ski_resorts=SkiResort.all
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
    @reviews=Review.all
  end
end