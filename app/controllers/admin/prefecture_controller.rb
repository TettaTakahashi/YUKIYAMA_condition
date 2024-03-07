class Admin::PrefectureController < ApplicationController
    
    def index
      @prefectures=Prefecture.all
      @prefecture=Prefecture.new
    end
    
    def edit
      @prefecture=Prefecture.find(params[:id])
    end
    
    def create
      @prefecture=Prefecture.new(prefecture_params)
      if @prefecture.save
        redirect_to admin_prefecture_index_path
      else
        @prefectures=Prefecture.all
        redirect_to admin_prefecture_index_path
      end
    end
    
    def update
      @prefecture=Prefecture.find(params[:id])
      @prefecture.update(prefecture_params)
      redirect_to admin_prefecture_index_path
    end
    
    
    private
    
    def prefecture_params
      params.require(:prefecture).permit(:prefecture_name)
    end
end
