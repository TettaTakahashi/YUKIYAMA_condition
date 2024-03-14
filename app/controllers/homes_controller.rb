class HomesController < ApplicationController
  def top
    @ski_resorts=SkiResort.all
    @ski_resorts=SkiResort.all.order(updated_at: :desc)
  end
  
  def registration_top
  end
  
  def session_top
  end
end
