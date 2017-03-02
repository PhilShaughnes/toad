class ApplicationController < ActionController::API
  private

  def request_error(msg, code = 400)
    render json: {errors: msg.map{ |m| { error: m }}}, status: code
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token]) if params[:token]
  end

  def require_user
      request_error(["You need to be logged in to do this."], 401) unless current_user
  end

end
