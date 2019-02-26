class User < ApplicationRecord
  has_many :favorites

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :zipcode, presence: true, length: {in: 4..5}, numericality: {only_integer: true}

  def favorite_petfinder_id
    favorites.map{|favorite| favorite.petfinder_id}
  end
  
end
