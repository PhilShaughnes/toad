class SocializeController < ApplicationController

  before_action :require_user

  def follow_toggle
    user = User.find_by(username: params[:username])
    user ? current_user.toggle_follow!(user) : request_error("not a user")
    puts "followed!"
    render json: [current_user, user, "followed!"]
  end
end
