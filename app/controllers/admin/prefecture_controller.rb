class Admin::PrefectureController < ApplicationController
    
    def index
      @prefectures=Prefecture.all
      @prefecture=Prefecture.new
    end
    
    def edit
      
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
      
    end
    
    
    private
    
    def prefecture_params
      params.require(:prefecture).permit(:prefecture_name)
    end
end
