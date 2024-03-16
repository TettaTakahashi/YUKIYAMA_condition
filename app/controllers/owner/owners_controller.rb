class Owner::OwnersController < ApplicationController
  before_action :authenticate_owner!
    
  def show
    @owner=Owner.find(current_owner.id)
  end
  
  def edit
    @owner=Owner.find(current_owner.id)
  end
  
  def update
    owner=Owner.find(current_owner.id)
    owner.update(owner_params)
    redirect_to owners_my_page_path
  end
  
  def confirm_withdraw
    
  end
  
  def withdraw
    @owner=Owner.find(current_owner.id)
    @owner.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def owner_params
    params.require(:owner).permit(:owner_name, :email)
  end
end
