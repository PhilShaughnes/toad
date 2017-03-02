class UsersController < ApplicationController
  def index
    render json: "it works!"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #binding.pry
      render json: @user
    else
      request_error(@user.errors.full_messages)
    end
  end


  private
  def user_params
    params.permit(:username, :first_name, :last_name, :email, :password, :photo_url)
  end
end
