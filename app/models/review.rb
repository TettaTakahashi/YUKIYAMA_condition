class Review < ApplicationRecord
    
  belongs_to :customer
  
  belongs_to :ski_resort
end
