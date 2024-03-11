class FavoriteResort < ApplicationRecord
    
  belongs_to :customer
  
  belongs_to :ski_resort
end
