class Owner::SkiResortsController < ApplicationController
  
  def index
    
  end
  
  def new
    @ski_resort=SkiResort.new
  end
  
  def create
    @ski_resort=SkiResort.new(ski_resort_params)
    @ski_resort.save
    redirect_to ski_resort_path(@ski_resort)
  end
  
  def show
      
  end
  
  private
  
  def ski_resort_params
    params.require(:ski_resort).permit(:image, :name, :introduction, :sales_active, :snow_active, :waiting_time, :price, :road_condition, :weather, :prefecture_id)
  end
end
