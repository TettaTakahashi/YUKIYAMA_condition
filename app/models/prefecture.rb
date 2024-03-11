class Prefecture < ApplicationRecord
  has_many :ski_resorts, dependent: :destroy
  
end
