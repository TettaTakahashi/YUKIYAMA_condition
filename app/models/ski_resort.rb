class SkiResort < ApplicationRecord
  
  has_one_attached :image
    
  has_many :favorite_resorts, dependent: :destroy
  
  has_many :reviews, dependent: :destroy
  
  belongs_to :owner
  
  belongs_to :prefecture
  
  has_many :customers, through: :favorite_resorts
  
  def favorite_resorted_by?(customer)
    favorite_resorts.where(customer_id: customer).exists?
  end
end
