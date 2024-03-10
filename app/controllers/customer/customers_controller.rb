class Customer::CustomersController < ApplicationController
    
  def show
    @customer=Customer.find(current_customer.id)
  end
  
  def edit
    @customer=Customer.find(current_customer.id)
  end
  
  def update
    customer=Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customers_my_page_path
  end
  
  def confirm_withdraw
    
  end
  
  def withdraw
    @customer=Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:customer_name, :email)
  end
end
