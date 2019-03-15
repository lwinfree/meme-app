class Favorite < ApplicationRecord
  belongs_to :user
  def pet_info
    pet = HTTP.get("http://api.petfinder.com/pet.get?key=#{ENV['API_KEY']}&id=#{petfinder_id}&format=json").parse
    return {
      pet_photo: pet["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"],
      pet_name: pet["petfinder"]["pet"]["name"]["$t"]
    }
  end
end
