class SocializeController < ApplicationController

  before_action :require_user, only: [:follow_toggle]

  def follow_toggle
    puts "trying to follow ......"
    user = User.find_by(username: params[:username])
    puts "checked, user is #{user.username}"
    puts "params are:"
    p params
    puts "end params ........"
    if user
      puts "followed!"
      current_user.toggle_follow!(user)
      render json: "follow status changed!"
    else
      puts "sending not a user :( ........"
      request_error("not a user.")
    end

  end
end
