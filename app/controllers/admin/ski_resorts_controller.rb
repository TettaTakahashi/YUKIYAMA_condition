class Admin::SkiResortsController < ApplicationController
    
  def index
    @ski_resorts=SkiResort.all
  end
end
