class Api::UsersController < ApplicationController
  
  def show
    # @user = User.find(params[:id])
    @user = current_user
    render 'show.json.jbuilder'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      zipcode: params[:zipcode],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: "New user created"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end

  end
end
