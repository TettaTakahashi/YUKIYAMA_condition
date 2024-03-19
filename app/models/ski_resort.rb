class SkiResort < ApplicationRecord
  
  has_one_attached :image
    
  has_many :favorite_resorts, dependent: :destroy
  
  has_many :reviews, dependent: :destroy
  
  belongs_to :owner
  
  belongs_to :prefecture
  
  def self.looks(search, word)
    if search == "perfect_match"
      @ski_resort=SkiResort.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @ski_resort=SkiResort.where("title LIKE?","#{word}")
    elsif search == "backward_match"
      @ski_resort=SkiResort.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @ski_resort=SkiResort.where("title LIKE?","#{word}")
    else
      @ski_resort=SkiResort.all
    end
  end
  
end
