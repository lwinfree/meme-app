class Api::UsersController < ApplicationController
  
  def show
    @user = current_user
    # if @user.zipcode.digits.length < 5
    #   @user.zipcode = "0"+"#{@user.zipcode}"
    # else
    #   @user.zipcode = @user.zipcode
    # end
    render 'show.json.jbuilder'
  end

  def favorites
    @user = current_user
    render 'user_favorites.json.jbuilder'
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

  def update
    @user = current_user
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.zipcode = params[:zipcode] || @user.zipcode
    @user.password = params[:password] || @user.password_digest

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
    
  end

  def destroy
    @user = current_user
    @user.destroy
    render json: {message: "User successfully destroyed"}
  end
end
