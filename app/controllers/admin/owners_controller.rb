class Admin::OwnersController < ApplicationController
    
  def index
    @owners=Owner.all
  end
  
  def show
    @owner=Owner.find(params[:id])
  end
  
  def edit
    @owner=Owner.find(params[:id])
  end
  
  def update
    @owner=Owner.find(params[:id])
    @owner.update(owner_params)
    redirect_to admin_owner_path(@owner)
  end
  
  
  private
  
  def owner_params
    params.require(:owner).permit(:owner_name, :email)
  end
end
