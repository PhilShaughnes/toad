class PostsController < ApplicationController

  before_action :require_user, only: [:create]

  def index
    @post = case
    when params[:user_id] then User.find(params[:user_id]).posts
    when current_user then Post.timeline(current_user)
    else Post.order("created_at DESC")
    end
    render json: @post
  end

  #   if current_user
  #     @post = Post.timeline(current_user)
  #   else
  #     @post = Post.all
  #   end
  #   render json: @post
  # end

  def create
    p params
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      render json: @post
      #render json: Post.all
      #TODO: just render @post here
    else
      request_error(@post.errors.full_messages)
    end
  end

  def post_params
    params.permit(:message)
  end

end
