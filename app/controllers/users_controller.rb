class UsersController < ApplicationController

  before_action :require_user, only: [:show, :index]

  def index
    @user = User.all
    render json: @user
  end

  def show
    p params
    if params[:id].downcase == "profile"
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    if @user
      render json: @user
    else
      request_error("User not found")
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExtendedSerializer
    else
      request_error(@user.errors.full_messages)
    end
  end

  def login

    @user = User.find_by(username: params[:username])&.
              authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExtendedSerializer
    else
      request_error("Invalid username or password", 401)
    end
  end

  def update

  end

  # def show
  #   render json: User.find(params[:id])
  # end


  private
  def user_params
    params.permit(:username, :first_name, :last_name, :email, :password, :photo_url)
  end
end
