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

    @favorite = Favorite.find_by(user_id: current_user.id, petfinder_id: params[:id])

    render 'show.json.jbuilder'
    #TODO: add in logic to show if a pet is favorited
    #if current_user.favorite_petfinder_id == @petfinder_id
      #display filled in heart icon
    #else
      #display empty heart icon
    #end
  end
end
