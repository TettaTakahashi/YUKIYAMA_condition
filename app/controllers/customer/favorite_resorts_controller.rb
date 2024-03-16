class Customer::FavoriteResortsController < ApplicationController
    before_action :authenticate_customer!
end
