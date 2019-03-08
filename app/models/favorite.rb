class Favorite < ApplicationRecord
  belongs_to :user
  def pet_image
    pet = HTTP.get("http://api.petfinder.com/pet.get?key=#{ENV['API_KEY']}&id=#{petfinder_id}&format=json").parse
    return pet["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]
  end
  def pet_name
    pet = HTTP.get("http://api.petfinder.com/pet.get?key=#{ENV['API_KEY']}&id=#{petfinder_id}&format=json").parse
    return pet["petfinder"]["pet"]["name"]["$t"]
  end
end
