class Review < ApplicationRecord
    
  belongs_to :customer
  
  belongs_to :ski_resort
  
  validates :comment, presence: true
end
