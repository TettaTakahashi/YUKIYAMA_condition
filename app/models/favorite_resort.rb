class FavoriteResort < ApplicationRecord
    
  belongs_to :customer
  
  belongs_to :ski_resort
  
  validates :customer_id, uniqueness: {scope: :ski_resort_id}
end
