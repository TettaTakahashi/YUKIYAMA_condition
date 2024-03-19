class SearchesController < ApplicationController
  def search
    @range=params[:range]
    @word=params[:word]
    @ski_resorts=SkiResort.looks(params[:search], params[:word])
  end
end
