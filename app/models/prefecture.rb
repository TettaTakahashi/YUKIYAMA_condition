class Prefecture < ApplicationRecord
  has_many :ski_resorts, dependent: :destroy
  
  validates :prefecture_name, presence: true, uniqueness: true
  
end
