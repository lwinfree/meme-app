class Api::FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(petfinder_id: params[:petfinder_id],
      user_id: current_user.id)

    if @favorite.save
      render 'show.json.jbuilder'
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    @favorite = Favorite.find_by(petfinder_id: params[:petfinder_id])
    @favorite.destroy
    render json: {message: "No longer a favorite"}
  end
end
