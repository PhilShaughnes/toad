class SocializeController < ApplicationController

  before_action :require_user, only: [:follow_toggle]

  def follow_toggle
    user = User.find_by(username: params[:username])
    if user
      current_user.toggle_follow!(user)
      message = {message: "follow status changed!"}
      render json: message
    else
      request_error("not a user.")
    end

  end
end
