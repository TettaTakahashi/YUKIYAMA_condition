class Customer::SkiResortsController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :search]
  
  def index
    @ski_resorts=SkiResort.page(params[:page])
    @ski_resorts_all=SkiResort.all
    @prefectures=Prefecture.all
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
    @review=Review.new
    @reviews=Review.all
    
    @favorite_resorts_count=0
    @favorite_resorts_count+=@ski_resort.favorite_resorts.size
  end
  
  def search
    @prefectures=Prefecture.all
    min_search=params[:min_search]
    max_search=params[:max_search]
    
    @ski_resorts=SkiResort.all
    @ski_resorts=@ski_resorts.where('name LIKE ?', "%#{params[:name]}") if params[:name].present?
    @ski_resorts=@ski_resorts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
    @ski_resorts=@ski_resorts.where("price <= #{max_search}") if max_search.present?
    @ski_resorts=@ski_resorts.where("price >= #{min_search}") if min_search.present?
    @ski_resorts=@ski_resorts.where(snow_active: params[:snow_active]) if params[:snow_active].present?
    @ski_resorts=@ski_resorts.where(sales_active: params[:sales_active]) if params[:sales_active].present?
    @ski_resorts=@ski_resorts.page(params[:page])
  end
  
end