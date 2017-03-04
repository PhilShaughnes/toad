class SocializeController < ApplicationController

  before_action :require_user, only: [:follow_toggle]

  def follow_toggle
    user = User.find_by(username: params[:username])
    if user
      puts "followed!"
      current_user.toggle_follow!(user)
      render json: [current_user, user, "followed!"]
    else
      request_error("not a user.")
    end

  end
end
