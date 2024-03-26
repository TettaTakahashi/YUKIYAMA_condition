class Customer::SkiResortsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @ski_resorts=SkiResort.page(params[:page])
    @ski_resorts_all=SkiResort.all
    @prefectures=Prefecture.all
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
    @review=Review.new
    @reviews=Review.all
  end
  
  def search
    @prefectures=Prefecture.all
    min_search=params[:min_search]
    max_search=params[:max_search]
    if params[:name].present?
      @ski_resorts=SkiResort.where('name LIKE ?', "%#{params[:name]}")
    elsif max_search != '' && max_search != nil && min_search != '' && min_search != nil
      @ski_resorts=SkiResort.where("price >= #{min_search} and price <= #{max_search}")
    elsif max_search != '' && max_search != nil
      @ski_resorts=SkiResort.where("price <= #{max_search}")
    elsif min_search != '' && min_search != nil
      @ski_resorts=SkiResort.where("price >= #{min_search}")
    else
      @ski_resorts=SkiResort.where(prefecture_id: params[:format]).page(params[:page])
    end
  end
end