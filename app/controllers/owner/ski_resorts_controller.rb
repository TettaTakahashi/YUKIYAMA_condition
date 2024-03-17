class Owner::SkiResortsController < ApplicationController
  before_action :authenticate_owner!
  
  def index
    @ski_resorts=current_owner.ski_resorts
  end
  
  def new
    @ski_resort=SkiResort.new
  end
  
  def create
    @ski_resort=current_owner.ski_resorts.new(ski_resort_params)
    @ski_resort.save
    redirect_to owners_ski_resorts_path
  end
  
  def show
    @ski_resort=SkiResort.find(params[:id])
  end
  
  def edit
    @ski_resort=SkiResort.find(params[:id])
  end
  
  def update
    @ski_resort=current_owner.ski_resorts.find(params[:id])
    if @ski_resort.update(ski_resort_params)
      redirect_to owners_ski_resort_path(@ski_resort)
    else
      render :edit
    end
  end
  
  def destroy
     @ski_resort=SkiResort.find(params[:id])
     @ski_resort.destroy
     redirect_to owners_ski_resorts_path
  end
  
  
  private
  
  def ski_resort_params
    params.require(:ski_resort).permit(:image, :name, :introduction, :sales_active, :snow_active, :waiting_time, :price, :road_condition, :weather, :prefecture_id)
  end
end
