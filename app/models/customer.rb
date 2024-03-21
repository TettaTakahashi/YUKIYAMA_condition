class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :favorite_resorts, dependent: :destroy
  
  has_many :reviews, dependent: :destroy
  
  has_many :ski_resorts, through: :favorite_resorts
end
