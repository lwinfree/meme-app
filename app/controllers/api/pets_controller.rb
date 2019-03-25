include Magick

class Api::PetsController < ApplicationController

  def index
    if current_user
      if current_user.zipcode.digits.length < 5
        @location = "0"+"#{current_user.zipcode}"
      else
        @location = current_user.zipcode
      end 
    else
      @location = 97214 #default
    end

    pets = HTTP.get("http://api.petfinder.com/pet.find?key=#{ENV['API_KEY']}&location=#{@location}&animal=dog&format=json").parse
    @pets = pets["petfinder"]["pets"]["pet"]

    render 'index.json.jbuilder'

  end

  def show
    @petfinder_id = params[:id]
    @pet = HTTP.get("http://api.petfinder.com/pet.get?key=#{ENV['API_KEY']}&id=#{@petfinder_id}&format=json").parse

    if @pet["petfinder"]["header"]["status"]["message"]["$t"] == "shelter opt-out"
      @no_pet = true
      @no_pet_message = "No information for this pet"
    else
      @no_pet = false
      @pet = @pet["petfinder"]["pet"]

      image = @pet["media"]["photos"]["photo"][2]["$t"]

      # @favorite = Favorite.find_by(user_id: current_user.id, petfinder_id: params[:id])
 
      dog = ImageList.new(image)

      texts = ['wow', 'such woofer', 'smol boi', 'floofer', 'many doge', 'much love', 'sub woofer', 'amaze', 'needz', 'goob', 'pupper']
      positions = [Magick::NorthWestGravity, Magick::EastGravity, Magick::SouthWestGravity]
      x = 0
      text = Magick::Draw.new
      text.font_family = 'NewCenturySchlbk'
      text.pointsize = 50

      positions.each do |position|
        x = rand(0..10)
        text.gravity = position
        text.annotate(dog, 0,0,0,0, texts[x]) {
          self.fill = 'gold'
        }
      end
      @meme = dog.write("app/assets/images/meme.jpg")

    end
    render 'show.json.jbuilder'
  end
end
