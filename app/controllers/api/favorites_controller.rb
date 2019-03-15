class Api::FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(petfinder_id: params[:petfinder_id],
      user_id: current_user.id)

    if @favorite.save
      # this is necessary for creating the favorite using favorite button: render json: {message: "New favorite created"}
      # this is necessary for showing the favs on the user profile:
      render 'show.json.jbuilder'
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    @favorite = Favorite.find_by(petfinder_id: params[:id])
    @favorite.destroy
    render json: {message: "No longer a favorite"}
  end
end
