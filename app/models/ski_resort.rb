class SkiResort < ApplicationRecord
    
  has_many :favorite_resorts, dependent: :destroy
  
  belongs_to :owner
  
  belongs_to :prefecture
end
