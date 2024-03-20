class Customer::PrefectureController < ApplicationController
    
  def show
    @prefectures=Prefecture.all
    @prefecture=Prefecture.find(params[:id])
  end
end
