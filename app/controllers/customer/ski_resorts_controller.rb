class Customer::SkiResortsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @ski_resorts=SkiResort.all
    @prefectures=Prefecture.all
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
    @review=Review.new
    @reviews=Review.all
  end
  
  def search
    if params[:name].present?
      @ski_resorts=SkiResort.where('name LIKE ?', "%#{params[:name]}")
    else
      @ski_resorts=SkiResort.none
    end
  end
end