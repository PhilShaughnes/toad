class UsersController < ApplicationController

  before_action :require_user, only: [:show, :index]

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find_by(username: params[:username])
    render json: @user
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




  private
  def user_params
    params.permit(:username, :first_name, :last_name, :email, :password, :photo_url)
  end
end
