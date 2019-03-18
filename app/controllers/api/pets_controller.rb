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
    # @pet_photo = @pets[]["media"]
    # @pet_photo = @pets.map{|pet| pet["media"]["photos"]["photo"]}
    # note: this gives me every pet's images per pet (as opposed to just that pet's images) bc of the loop in the view @pet_photo = @pets.map{|pet| pet["media"]["photos"]["photo"]}

    render 'index.json.jbuilder'

  end

  def show
    @petfinder_id = params[:id]
    @pet = HTTP.get("http://api.petfinder.com/pet.get?key=#{ENV['API_KEY']}&id=#{@petfinder_id}&format=json").parse
    @pet = @pet["petfinder"]["pet"]

    # @favorite = Favorite.find_by(user_id: current_user.id, petfinder_id: params[:id])

    

    dog = ImageList.new("http://photos.petfinder.com/photos/pets/43801171/1/?bust=1547788392&width=500&-x.jpg")

    texts = ['wow', 'such woofer', 'smol boi', 'v floof', 'many doge', 'much love', 'sub woofer', 'so goob', 'amaze', 'needz hooman', 'goob pupper']
    positions = [Magick::NorthWestGravity, Magick::NorthEastGravity, Magick::SouthWestGravity]
    x = 0
    text = Magick::Draw.new
    text.font_family = 'helvetica'
    text.pointsize = 25

    positions.each do |position|
      x = rand(0..10)
      text.gravity = position
      text.annotate(dog, 0,0,0,0, texts[x]) {
        self.fill = 'gray83'
      }
    end
    @meme = dog.write("app/assets/images/meme.jpg")
    # @meme = "/app/assets/images/meme.jpg"
    # exit


    render 'show.json.jbuilder'

  end
end
