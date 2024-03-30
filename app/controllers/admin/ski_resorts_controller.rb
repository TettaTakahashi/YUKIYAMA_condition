class Admin::SkiResortsController < ApplicationController
  before_action :authenticate_admin!
    
  def index
    @ski_resorts=SkiResort.page(params[:page])
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
    @reviews=Review.all
    
    @favorite_resorts_count=0
    @favorite_resorts_count+=@ski_resort.favorite_resorts.size
  end
  
  def edit
     @ski_resort=SkiResort.find(params[:id])
  end
  
  def update
     @ski_resort=SkiResort.find(params[:id])
     @ski_resort.update(ski_resort_params)
     redirect_to admin_ski_resort_path(@ski_resort)
  end
  
  
  private
  
  def ski_resort_params
    params.require(:ski_resort).permit(:image, :name, :introduction, :sales_active, :snow_active, :waiting_time, :price, :road_condition, :weather, :prefecture_id)
  end
end
